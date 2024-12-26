import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final ValueNotifier<Set<int>> _selectedItems = ValueNotifier<Set<int>>({});
  final List<CartItem> _cartItems = [
    CartItem(
      id: 1,
      shopName: "AKASH Digital TV",
      itemName: "AKASH HD Connection",
      itemDetails: "Akash, Color Family: Black",
      price: 4299.0,
      quantity: 1,
      isAvailable: true,
    ),
    CartItem(
      id: 2,
      shopName: "",
      itemName:
          "Hair Bands for Kids Girl's Mini Elastic Soft Rubber Hair Bands - 100 Piece",
      itemDetails: "No Brand, Color Family: Multicolor",
      price: 117.0,
      quantity: 0,
      isAvailable: false,
    ),
  ];

  double _subtotal = 0.0;
  double _discount = 0.0;
  double _shippingFee = 0.0;
  double _tax = 0.0;
  final double _taxRate = 0.08; // 8% tax rate

  @override
  void dispose() {
    _selectedItems.dispose();
    super.dispose();
  }

  void _calculatePricing() {
    setState(() {
      _subtotal = _cartItems.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );
      _tax = _subtotal * _taxRate;
      _discount = 0; // No discount applied in this logic
    });
  }

  double get totalAmount => _subtotal - _discount + _shippingFee + _tax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              setState(() {
                _selectedItems.value.clear();
                _cartItems.removeWhere((item) => item.quantity > 0);
                _calculatePricing();
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _buildShippingAddress(),
                const Divider(height: 1, color: Colors.grey),
                _buildCartItems(),
                const Divider(height: 1, color: Colors.grey),
                _buildPricingSummary(),
              ],
            ),
          ),
          ValueListenableBuilder<Set<int>>(
            valueListenable: _selectedItems,
            builder: (context, selectedItems, child) {
              return selectedItems.isNotEmpty
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle checkout logic
                          },
                          child: const Text("Checkout"),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildShippingAddress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Add Shipping Address",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItems() {
    return Column(
      children: _cartItems.map((item) {
        return Column(
          children: [
            _buildCartItem(
              id: item.id,
              shopName: item.shopName,
              itemName: item.itemName,
              itemDetails: item.itemDetails,
              price: item.price.toStringAsFixed(2),
              quantity: item.quantity,
              isAvailable: item.isAvailable,
            ),
            const Divider(height: 1, color: Colors.grey),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildCartItem({
    required int id,
    required String shopName,
    required String itemName,
    required String itemDetails,
    required String price,
    required int quantity,
    required bool isAvailable,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (shopName.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.store, color: Colors.purple, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      shopName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios,
                    size: 14, color: Colors.grey),
              ],
            ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://via.placeholder.com/100",
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isAvailable ? Colors.black : Colors.grey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      itemDetails,
                      style: TextStyle(
                        fontSize: 12,
                        color: isAvailable ? Colors.grey : Colors.red,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "৳$price",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isAvailable ? Colors.orange : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Checkbox(
                value: _selectedItems.value.contains(id),
                onChanged: isAvailable
                    ? (bool? value) {
                        setState(() {
                          if (value == true) {
                            _selectedItems.value.add(id);
                          } else {
                            _selectedItems.value.remove(id);
                          }
                          _selectedItems.notifyListeners();
                          _calculatePricing();
                        });
                      }
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPricingSummary() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price Details',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildPriceRow('Subtotal', _subtotal),
            _buildPriceRow('Shipping Fee', _shippingFee),
            _buildPriceRow('Tax', _tax),
            const Divider(),
            _buildPriceRow('Total', totalAmount, isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal ? Theme.of(context).textTheme.titleMedium : null,
          ),
          Text(
            '৳${amount.toStringAsFixed(2)}',
            style: isTotal ? Theme.of(context).textTheme.titleMedium : null,
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final int id;
  final String shopName;
  final String itemName;
  final String itemDetails;
  final double price;
  final int quantity;
  final bool isAvailable;

  CartItem({
    required this.id,
    required this.shopName,
    required this.itemName,
    required this.itemDetails,
    required this.price,
    required this.quantity,
    required this.isAvailable,
  });
}
