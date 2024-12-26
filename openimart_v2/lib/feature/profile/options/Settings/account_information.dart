import 'package:flutter/material.dart';

class AccountInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Information'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Full Name'),
            subtitle: Text('mhrashid888'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to full name edit screen
            },
          ),
          Divider(),
          ListTile(
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to change password screen
            },
          ),
          Divider(),
          ListTile(
            title: Text('Add Mobile'),
            subtitle: Text('Not Set'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to add mobile screen
            },
          ),
          Divider(),
          ListTile(
            title: Text('Change Email'),
            subtitle: Text('mh********@gmail.com'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to change email screen
            },
          ),
          Divider(),
          ListTile(
            title: Text('Gender'),
            subtitle: Text('Not Set'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to set gender screen
            },
          ),
          Divider(),
          ListTile(
            title: Text('Birthday'),
            subtitle: Text('Not Set'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to set birthday screen
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AccountInformation(),
  ));
}
