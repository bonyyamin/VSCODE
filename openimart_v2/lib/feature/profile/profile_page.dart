import 'package:flutter/material.dart';
import 'package:openimart_v2/feature/profile/options/contact_customer_care.dart';
import 'package:openimart_v2/feature/profile/options/help_center.dart';
import 'package:openimart_v2/feature/profile/options/my_affilicates.dart';
import 'package:openimart_v2/feature/profile/options/my_messages_profile.dart';
import 'package:openimart_v2/feature/profile/options/my_reviews.dart';
import 'package:openimart_v2/feature/profile/options/payment_option.dart';
import 'package:openimart_v2/feature/profile/options/returns.dart';
import 'package:openimart_v2/feature/profile/options/to_pay.dart';
import 'package:openimart_v2/feature/profile/options/to_ship.dart';
import 'package:openimart_v2/feature/profile/options/to_receive.dart';
import 'package:openimart_v2/feature/profile/options/to_review.dart';

void main() {
  runApp(MaterialApp(home: ProfilePage()));
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(),
              _buildStats(),
              _buildOrders(context),
              _buildOptionsGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.blue.shade700],
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/default_avatar.png'),
          ),
          SizedBox(height: 12),
          Text(
            'Welcome User',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('Orders', '0'),
          _buildStatItem('Wishlist', '0'),
          _buildStatItem('Points', '0'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildOrders([BuildContext? context]) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Orders',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOrderItem(Icons.payment, 'To Pay', ToPayPage(), context),
                _buildOrderItem(
                    Icons.local_shipping, 'To Ship', ToShipPage(), context),
                _buildOrderItem(
                    Icons.inventory, 'To Receive', ToReceivePage(), context),
                _buildOrderItem(
                    Icons.rate_review, 'To Review', ToReviewPage(), context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(IconData icon, String label, Widget page,
      [BuildContext? context]) {
    return InkWell(
      onTap: context == null
          ? null
          : () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.blue.shade800),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildOptionsGrid() {
    final options = [
      {'icon': Icons.message, 'title': 'Messages', 'page': MyMessagesProfile()},
      {'icon': Icons.star, 'title': 'My Reviews', 'page': MyReviewsPage()},
      {
        'icon': Icons.card_giftcard,
        'title': 'My Affiliates',
        'page': MyAffiliatesPage()
      },
      {
        'icon': Icons.payment,
        'title': 'Payment Options',
        'page': PaymentOptionPage()
      },
      {
        'icon': Icons.assignment_return,
        'title': 'Returns',
        'page': ReturnsPage()
      },
      {'icon': Icons.help, 'title': 'Help Center', 'page': HelpCenterPage()},
      {
        'icon': Icons.headset_mic,
        'title': 'Customer Care',
        'page': ContactCustomerCare()
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        return _buildOptionItem(
          options[index]['icon'] as IconData,
          options[index]['title'] as String,
          options[index]['page'] as Widget,
          context,
        );
      },
    );
  }

  Widget _buildOptionItem(
      IconData icon, String title, Widget page, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.blue.shade800, size: 28),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
