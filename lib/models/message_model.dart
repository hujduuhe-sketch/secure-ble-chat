import 'dart:convert';

class Message {
  String id;
  String senderId;
  String recipientId;
  String type;
  String content;
  DateTime timestamp;

  Message({required this.id, required this.senderId, required this.recipientId, required this.type, required this.content, required this.timestamp});

  // JSON serialization
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      senderId: json['senderId'],
      recipientId: json['recipientId'],
      type: json['type'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'recipientId': recipientId,
      'type': type,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}