import 'package:flutter/material.dart';
import 'package:openimart_v2/feature/vendor/chat_message.dart';
import 'package:openimart_v2/feature/vendor/vendor.dart';

class VendorChat extends StatefulWidget {
  final Vendor vendor;

  VendorChat({required this.vendor});

  @override
  _VendorChatState createState() => _VendorChatState();
}

class _VendorChatState extends State<VendorChat> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    // Simulate some initial messages
    _messages.addAll([
      ChatMessage(
        message: "Hello! How can I assist you?",
        isVendor: true,
        timestamp: DateTime.now().subtract(Duration(minutes: 10)),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.vendor.profilePicture),
              radius: 20,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.vendor.name, style: TextStyle(fontSize: 16)),
                Text(widget.vendor.isOnline ? 'Online' : 'Offline',
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment:
          message.isVendor ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: message.isVendor
              ? Colors.grey.shade200
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.message,
              style: TextStyle(
                color: message.isVendor ? Colors.black : Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              _formatTime(message.timestamp),
              style: TextStyle(
                  fontSize: 10,
                  color: message.isVendor ? Colors.black54 : Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.1)),
        ],
      ),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.attach_file), onPressed: () {}),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
              onPressed: _sendMessage),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(
          message: _messageController.text,
          isVendor: false,
          timestamp: DateTime.now(),
        ));
      });
      _messageController.clear();
    }
  }

  String _formatTime(DateTime timestamp) {
    return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}
