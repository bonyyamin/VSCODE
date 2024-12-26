import 'package:flutter/material.dart';
import 'package:openimart_v2/feature/profile/options/Settings/account_information.dart';
import 'package:openimart_v2/feature/profile/options/Settings/addressbook.dart';
import 'package:openimart_v2/feature/profile/options/Settings/user_message_settings.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Account Information'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountInformation(),
                      ),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Address Book'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressBook(),
                      ),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Messages'),
                  subtitle:
                      Text('Receive exclusive offers and personal updates'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessageSettingsPage(),
                      ),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/bangladesh_flag.png'), // Add a proper flag image in assets
                  ),
                  title: Text('Country'),
                  subtitle: Text('Bangladesh is your current country'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Navigate to Change Country
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('বাংলা ভাষায় পরিবর্তন করুন'),
                  subtitle: Text('English is your current language'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Navigate to Change Language
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Policies'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Navigate to Policies
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Help'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Navigate to Help
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Feedback'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Navigate to Feedback
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Request Account Deletion'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Navigate to Account Deletion Request
                  },
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    // Handle Logout
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '9.7.2   (101979727)',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SettingsPage(),
  ));
}
