import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final ValueNotifier<Set<int>> _selectedItems = ValueNotifier<Set<int>>({});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {},
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
                _buildVoucherCodeInput(),
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
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItems() {
    return Column(
      children: [
        _buildCartItem(
          id: 1,
          shopName: "AKASH Digital TV",
          itemName: "AKASH HD Connection",
          itemDetails: "Akash, Color Family:Black",
          price: "৳ 4,299",
          oldPrice: "৳ 4,499",
          quantity: 1,
          imageUrl: "https://via.placeholder.com/100",
          isAvailable: true,
        ),
        const Divider(height: 1, color: Colors.grey),
        _buildCartItem(
          id: 2,
          shopName: "",
          itemName:
              "Hair Bands for Kids Girl's Mini Elastic Soft Rubber Hair Bands-100 Piece",
          itemDetails: "No Brand, Color Family:Multicolor",
          price: "৳ 117",
          oldPrice: "৳ 300",
          quantity: 0,
          imageUrl: "https://via.placeholder.com/100",
          isAvailable: false,
        ),
      ],
    );
  }

  Widget _buildCartItem({
    required int id,
    required String shopName,
    required String itemName,
    required String itemDetails,
    required String price,
    required String oldPrice,
    required int quantity,
    required String imageUrl,
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
                          fontSize: 14, fontWeight: FontWeight.bold),
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
                  imageUrl,
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
                          price,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isAvailable ? Colors.orange : Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          oldPrice,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Checkbox(
                value: _selectedItems.value.contains(id),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      _selectedItems.value.add(id);
                    } else {
                      _selectedItems.value.remove(id);
                    }
                    _selectedItems.notifyListeners();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVoucherCodeInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter Voucher Code",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
