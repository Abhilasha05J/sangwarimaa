import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/features/chatbot/data/model/chatbot_model.dart';

// TODO: point this at your actual Dio provider — adjust the import path
// and provider name below to match core/network/dio_client.dart.
import 'package:sangwari_maa/core/network/dio_client.dart' show dioProvider;

class ChatbotRepository {
  final Dio _dio;
  const ChatbotRepository(this._dio);

  /// GET /api/v1/women/faqs?lang=&category=
  /// Response envelope: { success, data: [...], meta, error }
  Future<List<FaqItem>> getFaqs({
    String lang = 'hi',
    String? category,
  }) async {
    final response = await _dio.get(
      '/api/v1/women/faqs',
      queryParameters: {
        'lang': lang,
        if (category != null) 'category': category,
      },
    );

    final envelope = response.data as Map<String, dynamic>;
    final data = envelope['data'];
    if (data is List) {
      return data
          .map((e) => FaqItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  /// POST /api/v1/women/chatbot/message
  /// Request: { message, language }
  /// Response envelope: { success, data: { reply, language, sources,
  /// suggested_questions }, meta, error }
  Future<ChatbotMessageResponse> sendMessage(
      String text, {
        String language = 'hi',
      }) async {
    final response = await _dio.post(
      '/api/v1/women/chatbot/message',
      data: {'message': text, 'language': language},
    );
    final envelope = response.data as Map<String, dynamic>;
    return ChatbotMessageResponse.fromJson(
      envelope['data'] as Map<String, dynamic>,
    );
  }

  /// GET /api/v1/women/chatbot/history
  /// `messages` is stored as a raw JSONB list on ChatbotConversation —
  /// TODO: confirm the per-message shape once you have a populated example
  /// (this assumes {role|sender, text|message, timestamp}).
  Future<List<ChatMessage>> getHistory() async {
    final response = await _dio.get('/api/v1/women/chatbot/history');
    final envelope = response.data as Map<String, dynamic>;
    final data = envelope['data'];
    if (data is List) {
      return data.map((e) {
        final map = e as Map<String, dynamic>;
        final isUser = (map['role'] ?? map['sender']) == 'user';
        return ChatMessage(
          text: (map['text'] ?? map['message'] ?? '') as String,
          sender: isUser ? MessageSender.user : MessageSender.bot,
          timestamp: DateTime.tryParse(map['timestamp']?.toString() ?? '') ??
              DateTime.now(),
        );
      }).toList();
    }
    return [];
  }

  /// DELETE /api/v1/women/chatbot/history
  Future<void> clearHistory() async {
    await _dio.delete('/api/v1/women/chatbot/history');
  }

  /// POST /api/v1/women/chatbot/feedback
  /// Request: { message_index, is_helpful, comment? }
  Future<void> sendFeedback({
    required int messageIndex,
    required bool isHelpful,
    String? comment,
  }) async {
    await _dio.post(
      '/api/v1/women/chatbot/feedback',
      data: {
        'message_index': messageIndex,
        'is_helpful': isHelpful,
        if (comment != null) 'comment': comment,
      },
    );
  }
}

final chatbotRepositoryProvider = Provider<ChatbotRepository>((ref) {
  return ChatbotRepository(ref.watch(dioProvider));
});