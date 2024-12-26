import 'package:flutter/material.dart';

class MessageSettingsPage extends StatefulWidget {
  @override
  _MessageSettingsPageState createState() => _MessageSettingsPageState();
}

class _MessageSettingsPageState extends State<MessageSettingsPage> {
  // Toggle states for switches
  bool _promotions = true;
  bool _orders = true;
  bool _activities = true;
  bool _sellerPromo = true;
  bool _chat = true;
  bool _email = false;
  bool _sms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          // APP Notification Section
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            color: Colors.grey[200],
            child: Text(
              'APP Notification',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          _buildSwitchTile(
            title: 'Promotions',
            subtitle: 'Be the first to find out about our upcoming deals',
            value: _promotions,
            onChanged: (value) {
              setState(() {
                _promotions = value;
              });
            },
          ),
          _buildSwitchTile(
            title: 'Orders',
            subtitle: 'Get the latest status on your order',
            value: _orders,
            onChanged: (value) {
              setState(() {
                _orders = value;
              });
            },
          ),
          _buildSwitchTile(
            title: 'Activities',
            subtitle: 'Updates on price drops, Feed and other in app events',
            value: _activities,
            onChanged: (value) {
              setState(() {
                _activities = value;
              });
            },
          ),
          _buildSwitchTile(
            title: 'Seller promo',
            subtitle:
                'Get notified about the promotion and voucher from seller',
            value: _sellerPromo,
            onChanged: (value) {
              setState(() {
                _sellerPromo = value;
              });
            },
          ),
          _buildSwitchTile(
            title: 'Chat',
            subtitle: 'Get notified when you receive a private chat message',
            value: _chat,
            onChanged: (value) {
              setState(() {
                _chat = value;
              });
            },
          ),
          // Other Channels Section
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            color: Colors.grey[200],
            child: Text(
              'Other Channels',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          _buildSwitchTile(
            title: 'Email',
            subtitle:
                'Receive our E-newsletters and handpicked recommendations via email',
            value: _email,
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
          ),
          _buildSwitchTile(
            title: 'SMS',
            subtitle:
                'Receive our extra special, not-to-be-missed offers via SMS',
            value: _sms,
            onChanged: (value) {
              setState(() {
                _sms = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue,
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MessageSettingsPage(),
  ));
}
