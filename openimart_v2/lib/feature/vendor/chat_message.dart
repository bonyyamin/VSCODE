class ChatMessage {
  final String message;
  final bool isVendor;
  final DateTime timestamp;

  ChatMessage({
    required this.message,
    required this.isVendor,
    required this.timestamp,
  });
}
