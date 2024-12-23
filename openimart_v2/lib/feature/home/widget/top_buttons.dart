import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Flipkart Logo
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.flash_on, color: Colors.blue, size: 20),
                SizedBox(width: 4),
                Text(
                  "Open I Mart",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15),
                ),
              ],
            ),
          ),

          // Minutes
          const Column(
            children: [
              Icon(Icons.delivery_dining, color: Colors.pink, size: 20),
              Text("Minutes",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ],
          ),

          // Pay
          const Column(
            children: [
              Icon(Icons.payment, color: Colors.blue, size: 28),
              Text("Pay",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
