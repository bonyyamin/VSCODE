import 'package:flutter/material.dart';
import 'package:openimart_v2/feature/vendor/chat.dart';
import 'package:openimart_v2/feature/vendor/vendor.dart';

class InboxScreen extends StatelessWidget {
  final List<Vendor> vendors = [
    Vendor(
      name: 'Tech Store',
      profilePicture: 'assets/vendor/tech_store.png',
      isOnline: true,
    ),
    Vendor(
      name: 'Fashion Hub',
      profilePicture: 'assets/vendor/fashion_hub.png',
      isOnline: false,
    ),
    Vendor(
      name: 'Gadget World',
      profilePicture: 'assets/vendor/gadget_world.png',
      isOnline: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: vendors.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final vendor = vendors[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(vendor.profilePicture),
              radius: 25,
            ),
            title: Text(vendor.name,
                style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text(vendor.isOnline ? 'Online' : 'Last seen recently'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VendorChat(vendor: vendor),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
