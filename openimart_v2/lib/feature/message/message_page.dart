import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Mark all as read",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryIcon(Icons.chat_bubble_outline, "Chats"),
                _buildCategoryIcon(Icons.inventory_2_outlined, "Orders"),
                _buildCategoryIcon(Icons.local_activity_outlined, "Activities"),
                _buildCategoryIcon(Icons.campaign_outlined, "Promos"),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Last 7 days",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMessageCard(
                  title: "🎉KICKS KARNIVAL IS HERE✨",
                  time: "05:00 PM",
                  description:
                      "🦶 UP TO 70% OFF👟12% Nagad Cashback👞5% Voucher Discount👠 Hurry, Deals end soon👗🛍️",
                  image: Image.asset("assets/featured/brand1.png"),
                ),
                _buildMessageCard(
                  title: "🎉KICKS KARNIVAL IS HERE✨",
                  time: "03:30 PM",
                  description:
                      "🦶 UP TO 70% OFF👟12% Nagad Cashback👞5% Voucher Discount👠 Hurry, Deals end soon👗🛍️",
                  image: Image.asset("assets/featured/brand2.png"),
                ),
                _buildMessageCard(
                  title: "🔥Grab Up to 60% Coin Discount!🎉",
                  time: "09:11 AM",
                  description:
                      "Coins = Big savings. Shop in Coin Channel NOW! 🛍️",
                  image: Image.asset("assets/featured/brand3.png"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildMessageCard({
    required String title,
    required String time,
    required String description,
    required Image image,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(time,
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: image,
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
