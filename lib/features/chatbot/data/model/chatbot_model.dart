// enum MessageSender { user, bot }
//
// /// Controls how a bot message renders in the chat list.
// /// `text`               -> plain bubble (default)
// /// `categoryOptions`    -> bubble + tappable top-level FAQ-category chips
// /// `subcategoryOptions` -> bubble + tappable sub-topic chips within a category
// /// `questionOptions`    -> bubble + tappable FAQ-question chips
// enum MessageContentType {
//   text,
//   categoryOptions,
//   subcategoryOptions,
//   questionOptions,
// }
//
// /// A single tappable chip shown under a bot bubble.
// class QuickOption {
//   final String id; // For questions: the FAQ's real `id`. For categories:
//   // the category code. For subcategories: the subcategory
//   // slug (or '__general__' for the uncategorized bucket).
//   final String label; // What's displayed on the chip (already localized).
//
//   const QuickOption({required this.id, required this.label});
// }
//
// class ChatMessage {
//   final String text;
//   final MessageSender sender;
//   final DateTime timestamp;
//   final MessageContentType contentType;
//   final List<QuickOption> options;
//
//   const ChatMessage({
//     required this.text,
//     required this.sender,
//     required this.timestamp,
//     this.contentType = MessageContentType.text,
//     this.options = const [],
//   });
// }
//
// /// Matches the `faqs` table / FAQOut schema:
// /// { id, category, subcategory, title_hi, title_en, content_hi, content_en, tags }
// class FaqItem {
//   final String id;
//   final String category; // real topic now, e.g. "bpcr" / "mhs" / "pnc"
//   final String? subcategory; // e.g. "newborn_danger_signs" within "pnc"; null if uncategorized
//   final String? titleHi;
//   final String? titleEn;
//   final String? contentHi;
//   final String? contentEn;
//   final List<String> tags;
//
//   const FaqItem({
//     required this.id,
//     required this.category,
//     this.subcategory,
//     this.titleHi,
//     this.titleEn,
//     this.contentHi,
//     this.contentEn,
//     this.tags = const [],
//   });
//
//   factory FaqItem.fromJson(Map<String, dynamic> json) => FaqItem(
//     id: json['id']?.toString() ?? '',
//     category: (json['category'] ?? '') as String,
//     subcategory: json['subcategory'] as String?,
//     titleHi: json['title_hi'] as String?,
//     titleEn: json['title_en'] as String?,
//     contentHi: json['content_hi'] as String?,
//     contentEn: json['content_en'] as String?,
//     tags: (json['tags'] as List?)?.map((e) => e.toString()).toList() ??
//         const [],
//   );
//
//   /// Question text in the requested language, falling back to the other
//   /// language if the requested one is missing (Hindi content is still
//   /// pending translation at the time of writing).
//   String title(String languageCode) => languageCode == 'hi'
//       ? (titleHi?.isNotEmpty == true ? titleHi! : (titleEn ?? ''))
//       : (titleEn?.isNotEmpty == true ? titleEn! : (titleHi ?? ''));
//
//   /// Answer text in the requested language, falling back the same way.
//   String content(String languageCode) => languageCode == 'hi'
//       ? (contentHi?.isNotEmpty == true ? contentHi! : (contentEn ?? ''))
//       : (contentEn?.isNotEmpty == true ? contentEn! : (contentHi ?? ''));
// }
//
// /// Matches POST /api/v1/women/chatbot/message's ChatbotMessageResponse:
// /// { reply, language, sources, suggested_questions }
// class ChatbotMessageResponse {
//   final String reply;
//   final String language;
//   final List<String> sources;
//   final List<String> suggestedQuestions;
//
//   const ChatbotMessageResponse({
//     required this.reply,
//     required this.language,
//     this.sources = const [],
//     this.suggestedQuestions = const [],
//   });
//
//   factory ChatbotMessageResponse.fromJson(Map<String, dynamic> json) =>
//       ChatbotMessageResponse(
//         reply: (json['reply'] ?? '') as String,
//         language: (json['language'] ?? 'hi') as String,
//         sources: (json['sources'] as List?)
//             ?.map((e) => e.toString())
//             .toList() ??
//             const [],
//         suggestedQuestions: (json['suggested_questions'] as List?)
//             ?.map((e) => e.toString())
//             .toList() ??
//             const [],
//       );
// }
enum MessageSender { user, bot }

/// Controls how a bot message renders in the chat list.
/// `text`               -> plain bubble (default)
/// `categoryOptions`    -> bubble + tappable top-level FAQ-category chips
/// `subcategoryOptions` -> bubble + tappable sub-topic chips within a category
/// `questionOptions`    -> bubble + tappable FAQ-question chips
enum MessageContentType {
  text,
  categoryOptions,
  subcategoryOptions,
  questionOptions,
  yesNoOptions,
}

/// A single tappable chip shown under a bot bubble.
class QuickOption {
  final String id; // For questions: the FAQ's real `id`. For categories:
  // the category code. For subcategories: the subcategory
  // slug (or '__general__' for the uncategorized bucket).
  final String label; // What's displayed on the chip (already localized).

  const QuickOption({required this.id, required this.label});
}

class ChatMessage {
  final String text;
  final MessageSender sender;
  final DateTime timestamp;
  final MessageContentType contentType;
  final List<QuickOption> options;

  const ChatMessage({
    required this.text,
    required this.sender,
    required this.timestamp,
    this.contentType = MessageContentType.text,
    this.options = const [],
  });
}

/// Matches the `faqs` table / FAQOut schema:
/// { id, category, subcategory, title_hi, title_en, content_hi, content_en, tags }
class FaqItem {
  final String id;
  final String category; // real topic now, e.g. "bpcr" / "mhs" / "pnc"
  final String? subcategory; // e.g. "newborn_danger_signs" within "pnc"; null if uncategorized
  final String? titleHi;
  final String? titleEn;
  final String? contentHi;
  final String? contentEn;
  final List<String> tags;

  const FaqItem({
    required this.id,
    required this.category,
    this.subcategory,
    this.titleHi,
    this.titleEn,
    this.contentHi,
    this.contentEn,
    this.tags = const [],
  });

  factory FaqItem.fromJson(Map<String, dynamic> json) => FaqItem(
    id: json['id']?.toString() ?? '',
    category: (json['category'] ?? '') as String,
    subcategory: json['subcategory'] as String?,
    titleHi: json['title_hi'] as String?,
    titleEn: json['title_en'] as String?,
    contentHi: json['content_hi'] as String?,
    contentEn: json['content_en'] as String?,
    tags: (json['tags'] as List?)?.map((e) => e.toString()).toList() ??
        const [],
  );

  /// Question text in the requested language, falling back to the other
  /// language if the requested one is missing (Hindi content is still
  /// pending translation at the time of writing).
  String title(String languageCode) => languageCode == 'hi'
      ? (titleHi?.isNotEmpty == true ? titleHi! : (titleEn ?? ''))
      : (titleEn?.isNotEmpty == true ? titleEn! : (titleHi ?? ''));

  /// Answer text in the requested language, falling back the same way.
  String content(String languageCode) => languageCode == 'hi'
      ? (contentHi?.isNotEmpty == true ? contentHi! : (contentEn ?? ''))
      : (contentEn?.isNotEmpty == true ? contentEn! : (contentHi ?? ''));
}

/// Matches POST /api/v1/women/chatbot/message's ChatbotMessageResponse:
/// { reply, language, sources, suggested_questions }
class ChatbotMessageResponse {
  final String reply;
  final String language;
  final List<String> sources;
  final List<String> suggestedQuestions;

  const ChatbotMessageResponse({
    required this.reply,
    required this.language,
    this.sources = const [],
    this.suggestedQuestions = const [],
  });

  factory ChatbotMessageResponse.fromJson(Map<String, dynamic> json) =>
      ChatbotMessageResponse(
        reply: (json['reply'] ?? '') as String,
        language: (json['language'] ?? 'hi') as String,
        sources: (json['sources'] as List?)
            ?.map((e) => e.toString())
            .toList() ??
            const [],
        suggestedQuestions: (json['suggested_questions'] as List?)
            ?.map((e) => e.toString())
            .toList() ??
            const [],
      );
}