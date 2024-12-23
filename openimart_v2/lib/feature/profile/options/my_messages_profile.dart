import 'package:flutter/material.dart';

class MyMessagesProfile extends StatefulWidget {
  @override
  _MyMessagesPageState createState() => _MyMessagesPageState();
}

class _MyMessagesPageState extends State<MyMessagesProfile> {
  // Mock data for vendors
  final List<Map<String, String>> vendors = [
    {"name": "Vendor 1", "lastMessage": "We have a sale today!", "avatar": ""},
    {
      "name": "Vendor 2",
      "lastMessage": "Your order has been shipped!",
      "avatar": ""
    },
    {
      "name": "Vendor 3",
      "lastMessage": "Thanks for your feedback.",
      "avatar": ""
    },
    {
      "name": "Vendor 4",
      "lastMessage": "Check out our new collection.",
      "avatar": ""
    },
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredVendors = vendors
        .where((vendor) =>
            vendor["name"]!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Messages"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search vendors...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // List of Vendors
          Expanded(
            child: ListView.builder(
              itemCount: filteredVendors.length,
              itemBuilder: (context, index) {
                final vendor = filteredVendors[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[100],
                    child: Text(
                      vendor["name"]![0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(vendor["name"]!),
                  subtitle: Text(
                    vendor["lastMessage"]!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to chat screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(vendorName: vendor["name"]!),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String vendorName;

  const ChatScreen({Key? key, required this.vendorName}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> messages = [
    {"text": "Hello, how can I help you?", "isVendor": "true"},
    {"text": "I want to know about my order status.", "isVendor": "false"},
    {"text": "Your order is on the way!", "isVendor": "true"},
  ];

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vendorName),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isVendor = message["isVendor"] == "true";
                return Align(
                  alignment:
                      isVendor ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isVendor ? Colors.grey[200] : Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      message["text"]!,
                      style: TextStyle(
                          color: isVendor ? Colors.black : Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        messages.add({
                          "text": _messageController.text,
                          "isVendor": "false",
                        });
                        _messageController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
