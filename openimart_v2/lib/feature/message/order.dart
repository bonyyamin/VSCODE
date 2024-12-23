import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  String _selectedFilter = 'All Orders';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Show search dialog
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilterSection(),
          Expanded(
            child: _buildOrdersList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          'All Orders',
          'Pending',
          'Processing',
          'Shipped',
          'Delivered',
          'Cancelled'
        ].map((filter) => _buildFilterChip(filter)).toList(),
      ),
    );
  }

  Widget _buildFilterChip(String filter) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        selected: _selectedFilter == filter,
        label: Text(filter),
        onSelected: (selected) {
          setState(() => _selectedFilter = filter);
        },
      ),
    );
  }

  Widget _buildOrdersList() {
    return ListView.builder(
      itemCount: 10, // Replace with actual order count
      itemBuilder: (context, index) {
        return OrderCard(
          orderId: 'ORD-${1000 + index}',
          orderDate: DateTime.now().subtract(Duration(days: index)),
          status: index % 5 == 0 ? 'Delivered' : 'Processing',
          totalAmount: 99.99 + (index * 10),
          onTap: () => _showOrderDetails(context),
        );
      },
    );
  }

  void _showOrderDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const OrderDetailsSheet(),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final DateTime orderDate;
  final String status;
  final double totalAmount;
  final VoidCallback onTap;

  const OrderCard({
    Key? key,
    required this.orderId,
    required this.orderDate,
    required this.status,
    required this.totalAmount,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(orderId, style: Theme.of(context).textTheme.titleMedium),
                  _buildStatusChip(),
                ],
              ),
              const SizedBox(height: 8),
              Text('Order Date: ${_formatDate(orderDate)}'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: \$${totalAmount.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleMedium),
                  TextButton(
                    onPressed: () {}, // Implement tracking
                    child: const Text('Track Order'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    return Chip(
      label: Text(status),
      backgroundColor: _getStatusColor(),
    );
  }

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'delivered':
        return Colors.green.shade100;
      case 'processing':
        return Colors.orange.shade100;
      case 'cancelled':
        return Colors.red.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class OrderDetailsSheet extends StatelessWidget {
  const OrderDetailsSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              _buildOrderHeader(),
              const Divider(),
              _buildProductList(),
              const Divider(),
              _buildShippingInfo(),
              const Divider(),
              _buildPaymentInfo(),
              const Divider(),
              _buildOrderTimeline(),
              const SizedBox(height: 16),
              _buildActionButtons(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOrderHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Order #ORD-1001',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Placed on 12 Mar 2024'),
      ],
    );
  }

  Widget _buildProductList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Products',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        // Add product list items here
      ],
    );
  }

  Widget _buildShippingInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Shipping Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        // Add shipping details here
      ],
    );
  }

  Widget _buildPaymentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Payment Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        // Add payment details here
      ],
    );
  }

  Widget _buildOrderTimeline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Order Timeline',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        // Add timeline widget here
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {}, // Implement download invoice
          child: const Text('Download Invoice'),
        ),
        ElevatedButton(
          onPressed: () {}, // Implement reorder
          child: const Text('Reorder'),
        ),
      ],
    );
  }
}
