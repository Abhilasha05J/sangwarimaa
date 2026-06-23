final chatMessagesProvider =
StateNotifierProvider<ChatNotifier, List<ChatMessage>>(
      (_) => ChatNotifier(),
);

class ChatNotifier extends StateNotifier<List<ChatMessage>> {
  ChatNotifier() : super([]);

  void addMessage(ChatMessage message) {
    state = [...state, message];
  }

  void clear() => state = [];
}
