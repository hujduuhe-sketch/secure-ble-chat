import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMessage {
  final String id;
  final String message;
  final DateTime timestamp;

  ChatMessage({required this.id, required this.message}) : timestamp = DateTime.now();
}

class ChatProvider extends StateNotifier<List<ChatMessage>> {
  ChatProvider() : super([]);

  void addMessage(String message) {
    final newMessage = ChatMessage(id: DateTime.now().toIso8601String(), message: message);
    state = [...state, newMessage];
  }

  void removeMessage(String id) {
    state = state.where((message) => message.id != id).toList();
  }
}

final chatProvider = StateNotifierProvider<ChatProvider, List<ChatMessage>>((ref) {
  return ChatProvider();
});
