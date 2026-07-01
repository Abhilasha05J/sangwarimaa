// import 'package:flutter/foundation.dart' show debugPrint;
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
// import 'package:sangwari_maa/features/chatbot/data/model/chatbot_model.dart';
// import 'package:sangwari_maa/features/chatbot/data/repository/chatbot_repository.dart';
// import 'package:sangwari_maa/shared/providers/locale_provider.dart';
//
// part 'chatbot_provider.g.dart';
//
// const _backOptionId = '__back__';
// const _generalSubcatId = '__general__';
// const _yesOptionId = '__yes__';
// const _noOptionId = '__no__';
//
// /// Where the "back" chip on the current question list should return to.
// enum _BackTarget { categories, subcategories }
//
// @riverpod
// class ChatMessages extends _$ChatMessages {
//   List<FaqItem> _allFaqs = [];
//   List<FaqItem> _activeFaqs = [];
//   String? _currentCategory;
//   _BackTarget _backTarget = _BackTarget.categories;
//
//   @override
//   List<ChatMessage> build() {
//     // IMPORTANT: do NOT ref.watch(localeProvider) here — that would
//     // rerun build() on every language toggle and wipe the whole conversation.
//     Future.microtask(_initialize);
//     return [];
//   }
//
//   AppLocalizations _l10nFor(locale) => lookupAppLocalizations(locale);
//
//   Future<void> _initialize() async {
//     final locale = ref.read(localeProvider);
//     final l10n = _l10nFor(locale);
//
//     ref.read(chatIsTypingProvider.notifier).setTyping(true);
//     try {
//       final faqs = await ref
//           .read(chatbotRepositoryProvider)
//           .getFaqs(lang: locale.languageCode);
//       _allFaqs = faqs;
//
//       // Debug visibility — check your `flutter run` console with this if
//       // categories/answers still don't show up correctly.
//       final ids = faqs.map((f) => f.id).toList();
//       final duplicateIds = ids.toSet().length != ids.length;
//       debugPrint(
//         '[Chatbot] Fetched ${faqs.length} FAQs. '
//             'Categories: ${_categoryCodes}. '
//             'Duplicate ids: $duplicateIds. '
//             'Empty ids: ${ids.where((i) => i.isEmpty).length}.',
//       );
//
//       ref.read(chatIsTypingProvider.notifier).setTyping(false);
//       addMessage(_welcomeMessage(l10n));
//     } catch (e, st) {
//       debugPrint('[Chatbot] Failed to load FAQs: $e\n$st');
//       ref.read(chatIsTypingProvider.notifier).setTyping(false);
//       addMessage(ChatMessage(
//         text: l10n.chatbotCategoryLoadError,
//         sender: MessageSender.bot,
//         timestamp: DateTime.now(),
//       ));
//     }
//   }
//
//   List<String> get _categoryCodes => _allFaqs
//       .map((f) => f.category)
//       .where((c) => c.trim().isNotEmpty)
//       .toSet()
//       .toList();
//
//   String _categoryLabel(String code, AppLocalizations l10n) {
//     switch (code.toLowerCase()) {
//       case 'bpcr':
//         return l10n.chatbotCategoryBpcr;
//       case 'mhs':
//       case 'schemes':
//         return l10n.chatbotCategorySchemes;
//       case 'pnc':
//         return l10n.chatbotCategoryPnc;
//       default:
//         return code;
//     }
//   }
//
//   /// 'newborn_danger_signs' -> 'Newborn Danger Signs'.
//   /// English-only for now since the source content itself is English-only
//   /// pending Hindi translation — same gap noted for FAQ content.
//   String _prettifySlug(String slug) => slug
//       .split('_')
//       .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
//       .join(' ');
//
//   ChatMessage _welcomeMessage(AppLocalizations l10n) => ChatMessage(
//     text: l10n.chatbotWelcome,
//     sender: MessageSender.bot,
//     timestamp: DateTime.now(),
//     contentType: MessageContentType.categoryOptions,
//     options: _categoryCodes
//         .map((c) => QuickOption(id: c, label: _categoryLabel(c, l10n)))
//         .toList(),
//   );
//
//   QuickOption _backOption(AppLocalizations l10n) =>
//       QuickOption(id: _backOptionId, label: l10n.chatbotBackToTopics);
//
//   ChatMessage _subcategoryMessage(
//       String categoryId,
//       List<FaqItem> faqsInCategory,
//       AppLocalizations l10n,
//       ) {
//     final subcats = faqsInCategory.map((f) => f.subcategory).toSet().toList();
//     return ChatMessage(
//       text: l10n.chatbotQuestionsIntro(_categoryLabel(categoryId, l10n)),
//       sender: MessageSender.bot,
//       timestamp: DateTime.now(),
//       contentType: MessageContentType.subcategoryOptions,
//       options: [
//         ...subcats.map((s) => QuickOption(
//           id: s ?? _generalSubcatId,
//           label: s == null ? l10n.chatbotGeneralTopic : _prettifySlug(s),
//         )),
//         _backOption(l10n),
//       ],
//     );
//   }
//
//   void addMessage(ChatMessage message) => state = [...state, message];
//
//   Future<void> clear() async {
//     _activeFaqs = [];
//     _currentCategory = null;
//     state = [];
//     await _initialize();
//   }
//
//   /// Category chip tapped — drills into subcategories if this category has
//   /// a real sub-split, otherwise goes straight to the question list.
//   Future<void> selectCategory(QuickOption category) async {
//     final locale = ref.read(localeProvider);
//     final l10n = _l10nFor(locale);
//     final lang = locale.languageCode;
//
//     addMessage(ChatMessage(
//       text: category.label,
//       sender: MessageSender.user,
//       timestamp: DateTime.now(),
//     ));
//
//     // Brief "typing" pause so the user's tap registers visually before the
//     // next bubble pushes it up the screen.
//     ref.read(chatIsTypingProvider.notifier).setTyping(true);
//     await Future.delayed(const Duration(milliseconds: 350));
//     ref.read(chatIsTypingProvider.notifier).setTyping(false);
//
//     _currentCategory = category.id;
//     final faqsInCategory =
//     _allFaqs.where((f) => f.category == category.id).toList();
//
//     if (faqsInCategory.isEmpty) {
//       addMessage(ChatMessage(
//         text: l10n.chatbotNoFaqs,
//         sender: MessageSender.bot,
//         timestamp: DateTime.now(),
//       ));
//       return;
//     }
//
//     final subcats = faqsInCategory.map((f) => f.subcategory).toSet();
//
//     if (subcats.length <= 1) {
//       // No real subdivision (e.g. MHS) — skip straight to questions.
//       _backTarget = _BackTarget.categories;
//       _showQuestions(faqsInCategory, l10n, lang);
//       return;
//     }
//
//     _backTarget = _BackTarget.subcategories;
//     addMessage(_subcategoryMessage(category.id, faqsInCategory, l10n));
//   }
//
//   /// Subcategory chip tapped, or its "back" chip (-> back to categories).
//   Future<void> selectSubcategory(QuickOption sub) async {
//     final locale = ref.read(localeProvider);
//     final l10n = _l10nFor(locale);
//     final lang = locale.languageCode;
//
//     if (sub.id == _backOptionId) {
//       addMessage(_welcomeMessage(l10n));
//       return;
//     }
//
//     addMessage(ChatMessage(
//       text: sub.label,
//       sender: MessageSender.user,
//       timestamp: DateTime.now(),
//     ));
//
//     ref.read(chatIsTypingProvider.notifier).setTyping(true);
//     await Future.delayed(const Duration(milliseconds: 350));
//     ref.read(chatIsTypingProvider.notifier).setTyping(false);
//
//     final subcatValue = sub.id == _generalSubcatId ? null : sub.id;
//     final faqs = _allFaqs
//         .where((f) =>
//     f.category == _currentCategory && f.subcategory == subcatValue)
//         .toList();
//
//     _backTarget = _BackTarget.subcategories;
//     _showQuestions(faqs, l10n, lang);
//   }
//
//   void _showQuestions(List<FaqItem> faqs, AppLocalizations l10n, String lang) {
//     if (faqs.isEmpty) {
//       addMessage(ChatMessage(
//         text: l10n.chatbotNoFaqs,
//         sender: MessageSender.bot,
//         timestamp: DateTime.now(),
//       ));
//       return;
//     }
//     _activeFaqs = faqs;
//     addMessage(ChatMessage(
//       text: l10n.chatbotAnythingElse,
//       sender: MessageSender.bot,
//       timestamp: DateTime.now(),
//       contentType: MessageContentType.questionOptions,
//       options: [
//         ...faqs.map((f) => QuickOption(id: f.id, label: f.title(lang))),
//         _backOption(l10n),
//       ],
//     ));
//   }
//
//   /// Question chip tapped, or its "back" chip — returns to the subcategory
//   /// list if this category had one, otherwise to the top-level categories.
//   Future<void> selectQuestion(QuickOption option) async {
//     final locale = ref.read(localeProvider);
//     final l10n = _l10nFor(locale);
//     final lang = locale.languageCode;
//
//     if (option.id == _backOptionId) {
//       if (_backTarget == _BackTarget.subcategories && _currentCategory != null) {
//         final faqsInCategory =
//         _allFaqs.where((f) => f.category == _currentCategory).toList();
//         addMessage(_subcategoryMessage(_currentCategory!, faqsInCategory, l10n));
//       } else {
//         addMessage(_welcomeMessage(l10n));
//       }
//       return;
//     }
//
//     FaqItem? match;
//     for (final f in _activeFaqs) {
//       if (f.id == option.id) {
//         match = f;
//         break;
//       }
//     }
//     if (match == null) {
//       debugPrint(
//         '[Chatbot] No FAQ match for id="${option.id}" — '
//             'active ids: ${_activeFaqs.map((f) => f.id).toList()}',
//       );
//     }
//
//     addMessage(ChatMessage(
//       text: option.label,
//       sender: MessageSender.user,
//       timestamp: DateTime.now(),
//     ));
//
//     ref.read(chatIsTypingProvider.notifier).setTyping(true);
//     await Future.delayed(const Duration(milliseconds: 350));
//     ref.read(chatIsTypingProvider.notifier).setTyping(false);
//
//     addMessage(ChatMessage(
//       text: (match != null && match.content(lang).isNotEmpty)
//           ? match.content(lang)
//           : l10n.chatbotNoAnswerYet,
//       sender: MessageSender.bot,
//       timestamp: DateTime.now(),
//     ));
//
//     if (_activeFaqs.isNotEmpty) {
//       // Pause here too — this is the message that was getting shoved
//       // off-screen before the user had a chance to read the answer above it.
//       await Future.delayed(const Duration(milliseconds: 700));
//       addMessage(ChatMessage(
//         text: l10n.chatbotAnythingElse,
//         sender: MessageSender.bot,
//         timestamp: DateTime.now(),
//         contentType: MessageContentType.yesNoOptions,
//         options: [
//           QuickOption(id: _yesOptionId, label: l10n.chatbotYes),
//           QuickOption(id: _noOptionId, label: l10n.chatbotNo),
//         ],
//       ));
//     }
//   }
//
//   /// "Anything else?" Yes/No chip tapped.
//   /// Yes -> re-show the remaining questions in the current subcategory/category.
//   /// No  -> back to subcategories (if there were any) or categories.
//   void selectYesNo(QuickOption option) {
//     final locale = ref.read(localeProvider);
//     final l10n = _l10nFor(locale);
//     final lang = locale.languageCode;
//
//     if (option.id == _yesOptionId) {
//       if (_activeFaqs.isEmpty) {
//         addMessage(_welcomeMessage(l10n));
//         return;
//       }
//       addMessage(ChatMessage(
//         text: l10n.chatbotPickAnother,
//         sender: MessageSender.bot,
//         timestamp: DateTime.now(),
//         contentType: MessageContentType.questionOptions,
//         options: [
//           ..._activeFaqs.map((f) => QuickOption(id: f.id, label: f.title(lang))),
//           _backOption(l10n),
//         ],
//       ));
//       return;
//     }
//
//     // No -> go back up a level.
//     if (_backTarget == _BackTarget.subcategories && _currentCategory != null) {
//       final faqsInCategory =
//       _allFaqs.where((f) => f.category == _currentCategory).toList();
//       addMessage(_subcategoryMessage(_currentCategory!, faqsInCategory, l10n));
//     } else {
//       addMessage(_welcomeMessage(l10n));
//     }
//   }
//
//   /// Free-text input — always available regardless of where the user is
//   /// in the category/subcategory/question flow. Hits the real AI endpoint.
//   Future<void> sendUserMessage(String text) async {
//     final trimmed = text.trim();
//     if (trimmed.isEmpty) return;
//     final locale = ref.read(localeProvider);
//     final l10n = _l10nFor(locale);
//
//     addMessage(ChatMessage(
//       text: trimmed,
//       sender: MessageSender.user,
//       timestamp: DateTime.now(),
//     ));
//
//     ref.read(chatIsTypingProvider.notifier).setTyping(true);
//     try {
//       final response = await ref
//           .read(chatbotRepositoryProvider)
//           .sendMessage(trimmed, language: locale.languageCode);
//       ref.read(chatIsTypingProvider.notifier).setTyping(false);
//       addMessage(ChatMessage(
//         text: response.reply,
//         sender: MessageSender.bot,
//         timestamp: DateTime.now(),
//       ));
//     } catch (e, st) {
//       debugPrint('[Chatbot] sendMessage failed: $e\n$st');
//       ref.read(chatIsTypingProvider.notifier).setTyping(false);
//       addMessage(ChatMessage(
//         text: l10n.chatbotSendError,
//         sender: MessageSender.bot,
//         timestamp: DateTime.now(),
//       ));
//     }
//   }
// }
//
// @riverpod
// class ChatIsTyping extends _$ChatIsTyping {
//   @override
//   bool build() => false;
//
//   void setTyping(bool value) => state = value;
// }
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/chatbot/data/model/chatbot_model.dart';
import 'package:sangwari_maa/features/chatbot/data/repository/chatbot_repository.dart';
import 'package:sangwari_maa/shared/providers/locale_provider.dart';

part 'chatbot_provider.g.dart';

const _backOptionId = '__back__';
const _generalSubcatId = '__general__';
const _yesOptionId = '__yes__';
const _noOptionId = '__no__';

/// Where the "back" chip on the current question list should return to.
enum _BackTarget { categories, subcategories }

@Riverpod(keepAlive: true)
class ChatMessages extends _$ChatMessages {
  List<FaqItem> _allFaqs = [];
  List<FaqItem> _activeFaqs = [];
  String? _currentCategory;
  _BackTarget _backTarget = _BackTarget.categories;

  @override
  List<ChatMessage> build() {
    ref.listen(localeProvider, (previous, next) {
      if (previous != null && previous != next) {
        final l10n = _l10nFor(next);
        addMessage(ChatMessage(
          text: l10n.chatbotLanguageChanged,
          sender: MessageSender.bot,
          timestamp: DateTime.now(),
        ));
      }
    });
    Future.microtask(_initialize);
    return [];
  }

  AppLocalizations _l10nFor(locale) => lookupAppLocalizations(locale);

  Future<void> _initialize() async {
    final locale = ref.read(localeProvider);
    final l10n = _l10nFor(locale);

    ref.read(chatIsTypingProvider.notifier).setTyping(true);
    try {
      final faqs = await ref
          .read(chatbotRepositoryProvider)
          .getFaqs(lang: locale.languageCode);
      _allFaqs = faqs;

      // Debug visibility — check your `flutter run` console with this if
      // categories/answers still don't show up correctly.
      final ids = faqs.map((f) => f.id).toList();
      final duplicateIds = ids.toSet().length != ids.length;
      debugPrint(
        '[Chatbot] Fetched ${faqs.length} FAQs. '
            'Categories: ${_categoryCodes}. '
            'Duplicate ids: $duplicateIds. '
            'Empty ids: ${ids.where((i) => i.isEmpty).length}.',
      );

      ref.read(chatIsTypingProvider.notifier).setTyping(false);
      addMessage(_welcomeMessage(l10n));
    } catch (e, st) {
      debugPrint('[Chatbot] Failed to load FAQs: $e\n$st');
      ref.read(chatIsTypingProvider.notifier).setTyping(false);
      addMessage(ChatMessage(
        text: l10n.chatbotCategoryLoadError,
        sender: MessageSender.bot,
        timestamp: DateTime.now(),
      ));
    }
  }

  List<String> get _categoryCodes => _allFaqs
      .map((f) => f.category)
      .where((c) => c.trim().isNotEmpty)
      .toSet()
      .toList();

  String _categoryLabel(String code, AppLocalizations l10n) {
    switch (code.toLowerCase()) {
      case 'bpcr':
        return l10n.chatbotCategoryBpcr;
      case 'mhs':
      case 'schemes':
        return l10n.chatbotCategorySchemes;
      case 'pnc':
        return l10n.chatbotCategoryPnc;
      default:
        return code;
    }
  }

  /// Maps each known subcategory slug to its localized label.
  /// Falls back to a title-cased version of the slug (English only) for
  /// anything not yet in this map, so a new slug never disappears silently
  /// — it just won't be translated until added here + the ARB files.
  String _subcategoryLabel(String slug, AppLocalizations l10n) {
    switch (slug) {
    // BPCR subcategories
      case 'advanced':
        return l10n.chatbotSubAdvanced;
      case 'birth_companion':
        return l10n.chatbotSubBirthCompanion;
      case 'emergency_transport':
        return l10n.chatbotSubEmergencyTransport;
      case 'financial':
        return l10n.chatbotSubFinancial;
      case 'blood_donor':
        return l10n.chatbotSubBloodDonor;
      case 'high_risk_pregnancy':
        return l10n.chatbotSubHighRiskPregnancy;
      case 'labor_readiness':
        return l10n.chatbotSubLaborReadiness;
      case 'family_preparedness':
        return l10n.chatbotSubFamilyPreparedness;
      case 'delivery_kit':
        return l10n.chatbotSubDeliveryKit;
      case 'emergency_decision_making':
        return l10n.chatbotSubEmergencyDecisionMaking;
      case 'additional':
        return l10n.chatbotSubAdditional;
    // PNC subcategories
      case 'maternal_recovery':
        return l10n.chatbotSubMaternalRecovery;
      case 'nutrition':
        return l10n.chatbotSubNutrition;
      case 'mental_health':
        return l10n.chatbotSubMentalHealth;
      case 'family_planning':
        return l10n.chatbotSubFamilyPlanning;
      case 'newborn_care':
        return l10n.chatbotSubNewbornCare;
      case 'newborn_danger_signs':
        return l10n.chatbotSubNewbornDangerSigns;
      case 'immunization':
        return l10n.chatbotSubImmunization;
      case 'low_birth_weight':
        return l10n.chatbotSubLowBirthWeight;
      default:
        return _prettifySlug(slug);
    }
  }

  /// Fallback for any slug not yet mapped above: 'some_slug' -> 'Some Slug'.
  String _prettifySlug(String slug) => slug
      .split('_')
      .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
      .join(' ');

  ChatMessage _welcomeMessage(AppLocalizations l10n) => ChatMessage(
    text: l10n.chatbotWelcome,
    sender: MessageSender.bot,
    timestamp: DateTime.now(),
    contentType: MessageContentType.categoryOptions,
    options: _categoryCodes
        .map((c) => QuickOption(id: c, label: _categoryLabel(c, l10n)))
        .toList(),
  );

  QuickOption _backOption(AppLocalizations l10n) =>
      QuickOption(id: _backOptionId, label: l10n.chatbotBackToTopics);

  ChatMessage _subcategoryMessage(
      String categoryId,
      List<FaqItem> faqsInCategory,
      AppLocalizations l10n,
      ) {
    final subcats = faqsInCategory.map((f) => f.subcategory).toSet().toList();
    return ChatMessage(
      text: l10n.chatbotQuestionsIntro(_categoryLabel(categoryId, l10n)),
      sender: MessageSender.bot,
      timestamp: DateTime.now(),
      contentType: MessageContentType.subcategoryOptions,
      options: [
        ...subcats.map((s) => QuickOption(
          id: s ?? _generalSubcatId,
          label: s == null
              ? l10n.chatbotGeneralTopic
              : _subcategoryLabel(s, l10n),
        )),
        _backOption(l10n),
      ],
    );
  }

  void addMessage(ChatMessage message) => state = [...state, message];

  Future<void> clear() async {
    _activeFaqs = [];
    _currentCategory = null;
    state = [];
    await _initialize();
  }

  /// Category chip tapped — drills into subcategories if this category has
  /// a real sub-split, otherwise goes straight to the question list.
  Future<void> selectCategory(QuickOption category) async {
    final locale = ref.read(localeProvider);
    final l10n = _l10nFor(locale);
    final lang = locale.languageCode;

    addMessage(ChatMessage(
      text: category.label,
      sender: MessageSender.user,
      timestamp: DateTime.now(),
    ));

    // Brief "typing" pause so the user's tap registers visually before the
    // next bubble pushes it up the screen.
    ref.read(chatIsTypingProvider.notifier).setTyping(true);
    await Future.delayed(const Duration(milliseconds: 350));
    ref.read(chatIsTypingProvider.notifier).setTyping(false);

    _currentCategory = category.id;
    final faqsInCategory =
    _allFaqs.where((f) => f.category == category.id).toList();

    if (faqsInCategory.isEmpty) {
      addMessage(ChatMessage(
        text: l10n.chatbotNoFaqs,
        sender: MessageSender.bot,
        timestamp: DateTime.now(),
      ));
      return;
    }

    final subcats = faqsInCategory.map((f) => f.subcategory).toSet();

    if (subcats.length <= 1) {
      // No real subdivision (e.g. MHS) — skip straight to questions.
      _backTarget = _BackTarget.categories;
      _showQuestions(faqsInCategory, l10n, lang);
      return;
    }

    _backTarget = _BackTarget.subcategories;
    addMessage(_subcategoryMessage(category.id, faqsInCategory, l10n));
  }

  /// Subcategory chip tapped, or its "back" chip (-> back to categories).
  Future<void> selectSubcategory(QuickOption sub) async {
    final locale = ref.read(localeProvider);
    final l10n = _l10nFor(locale);
    final lang = locale.languageCode;

    if (sub.id == _backOptionId) {
      addMessage(_welcomeMessage(l10n));
      return;
    }

    addMessage(ChatMessage(
      text: sub.label,
      sender: MessageSender.user,
      timestamp: DateTime.now(),
    ));

    ref.read(chatIsTypingProvider.notifier).setTyping(true);
    await Future.delayed(const Duration(milliseconds: 350));
    ref.read(chatIsTypingProvider.notifier).setTyping(false);

    final subcatValue = sub.id == _generalSubcatId ? null : sub.id;
    final faqs = _allFaqs
        .where((f) =>
    f.category == _currentCategory && f.subcategory == subcatValue)
        .toList();

    _backTarget = _BackTarget.subcategories;
    _showQuestions(faqs, l10n, lang);
  }

  void _showQuestions(List<FaqItem> faqs, AppLocalizations l10n, String lang) {
    if (faqs.isEmpty) {
      addMessage(ChatMessage(
        text: l10n.chatbotNoFaqs,
        sender: MessageSender.bot,
        timestamp: DateTime.now(),
      ));
      return;
    }
    _activeFaqs = faqs;
    addMessage(ChatMessage(
      text: l10n.chatbotAnythingElse,
      sender: MessageSender.bot,
      timestamp: DateTime.now(),
      contentType: MessageContentType.questionOptions,
      options: [
        ...faqs.map((f) => QuickOption(id: f.id, label: f.title(lang))),
        _backOption(l10n),
      ],
    ));
  }

  /// Question chip tapped, or its "back" chip — returns to the subcategory
  /// list if this category had one, otherwise to the top-level categories.
  Future<void> selectQuestion(QuickOption option) async {
    final locale = ref.read(localeProvider);
    final l10n = _l10nFor(locale);
    final lang = locale.languageCode;

    if (option.id == _backOptionId) {
      if (_backTarget == _BackTarget.subcategories && _currentCategory != null) {
        final faqsInCategory =
        _allFaqs.where((f) => f.category == _currentCategory).toList();
        addMessage(_subcategoryMessage(_currentCategory!, faqsInCategory, l10n));
      } else {
        addMessage(_welcomeMessage(l10n));
      }
      return;
    }

    FaqItem? match;
    for (final f in _activeFaqs) {
      if (f.id == option.id) {
        match = f;
        break;
      }
    }
    if (match == null) {
      debugPrint(
        '[Chatbot] No FAQ match for id="${option.id}" — '
            'active ids: ${_activeFaqs.map((f) => f.id).toList()}',
      );
    }

    addMessage(ChatMessage(
      text: option.label,
      sender: MessageSender.user,
      timestamp: DateTime.now(),
    ));

    ref.read(chatIsTypingProvider.notifier).setTyping(true);
    await Future.delayed(const Duration(milliseconds: 350));
    ref.read(chatIsTypingProvider.notifier).setTyping(false);

    addMessage(ChatMessage(
      text: (match != null && match.content(lang).isNotEmpty)
          ? match.content(lang)
          : l10n.chatbotNoAnswerYet,
      sender: MessageSender.bot,
      timestamp: DateTime.now(),
    ));

    if (_activeFaqs.isNotEmpty) {
      // Pause here too — this is the message that was getting shoved
      // off-screen before the user had a chance to read the answer above it.
      await Future.delayed(const Duration(milliseconds: 700));
      addMessage(ChatMessage(
        text: l10n.chatbotAnythingElse,
        sender: MessageSender.bot,
        timestamp: DateTime.now(),
        contentType: MessageContentType.yesNoOptions,
        options: [
          QuickOption(id: _yesOptionId, label: l10n.chatbotYes),
          QuickOption(id: _noOptionId, label: l10n.chatbotNo),
        ],
      ));
    }
  }

  /// "Anything else?" Yes/No chip tapped.
  /// Yes -> re-show the remaining questions in the current subcategory/category.
  /// No  -> back to subcategories (if there were any) or categories.
  void selectYesNo(QuickOption option) {
    final locale = ref.read(localeProvider);
    final l10n = _l10nFor(locale);
    final lang = locale.languageCode;

    if (option.id == _yesOptionId) {
      if (_activeFaqs.isEmpty) {
        addMessage(_welcomeMessage(l10n));
        return;
      }
      addMessage(ChatMessage(
        text: l10n.chatbotPickAnother,
        sender: MessageSender.bot,
        timestamp: DateTime.now(),
        contentType: MessageContentType.questionOptions,
        options: [
          ..._activeFaqs.map((f) => QuickOption(id: f.id, label: f.title(lang))),
          _backOption(l10n),
        ],
      ));
      return;
    }

    // No -> go back up a level.
    if (_backTarget == _BackTarget.subcategories && _currentCategory != null) {
      final faqsInCategory =
      _allFaqs.where((f) => f.category == _currentCategory).toList();
      addMessage(_subcategoryMessage(_currentCategory!, faqsInCategory, l10n));
    } else {
      addMessage(_welcomeMessage(l10n));
    }
  }

  /// Free-text input — always available regardless of where the user is
  /// in the category/subcategory/question flow. Hits the real AI endpoint.
  Future<void> sendUserMessage(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    final locale = ref.read(localeProvider);
    final l10n = _l10nFor(locale);

    addMessage(ChatMessage(
      text: trimmed,
      sender: MessageSender.user,
      timestamp: DateTime.now(),
    ));

    ref.read(chatIsTypingProvider.notifier).setTyping(true);
    try {
      final response = await ref
          .read(chatbotRepositoryProvider)
          .sendMessage(trimmed, language: locale.languageCode);
      ref.read(chatIsTypingProvider.notifier).setTyping(false);
      addMessage(ChatMessage(
        text: response.reply,
        sender: MessageSender.bot,
        timestamp: DateTime.now(),
      ));
    } catch (e, st) {
      debugPrint('[Chatbot] sendMessage failed: $e\n$st');
      ref.read(chatIsTypingProvider.notifier).setTyping(false);
      addMessage(ChatMessage(
        text: l10n.chatbotSendError,
        sender: MessageSender.bot,
        timestamp: DateTime.now(),
      ));
    }
  }
}

@Riverpod(keepAlive: true)
class ChatIsTyping extends _$ChatIsTyping {
  @override
  bool build() => false;

  void setTyping(bool value) => state = value;
}