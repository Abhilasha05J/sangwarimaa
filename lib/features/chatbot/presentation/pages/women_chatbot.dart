// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sangwari_maa/core/constants/app_colors.dart';
// import 'package:sangwari_maa/core/constants/app_spacing.dart';
// import 'package:sangwari_maa/core/constants/app_typography.dart';
// import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
// import 'package:sangwari_maa/features/chatbot/data/model/chatbot_model.dart';
// import 'package:sangwari_maa/features/chatbot/presentation/provider/chatbot_provider.dart';
// import 'package:sangwari_maa/shared/widgets/app_background.dart';
// import 'package:sangwari_maa/shared/widgets/app_bar.dart';
// import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
//
// class ChatbotScreen extends ConsumerStatefulWidget {
//   const ChatbotScreen({super.key});
//
//   @override
//   ConsumerState<ChatbotScreen> createState() => _ChatbotScreenState();
// }
//
// class _ChatbotScreenState extends ConsumerState<ChatbotScreen> {
//   final TextEditingController _inputCtrl = TextEditingController();
//   final ScrollController _scrollCtrl = ScrollController();
//
//   @override
//   void dispose() {
//     _inputCtrl.dispose();
//     _scrollCtrl.dispose();
//     super.dispose();
//   }
//
//   void _scrollToBottom() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (_scrollCtrl.hasClients) {
//         _scrollCtrl.animateTo(
//           _scrollCtrl.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }
//
//   Future<void> _sendMessage(String text) async {
//     if (text.trim().isEmpty) return;
//     _inputCtrl.clear();
//     _scrollToBottom();
//
//     await ref.read(chatMessagesProvider.notifier).sendUserMessage(text);
//     _scrollToBottom();
//   }
//
//   Future<void> _onCategoryTap(QuickOption category) async {
//     await ref.read(chatMessagesProvider.notifier).selectCategory(category);
//     _scrollToBottom();
//   }
//
//   Future<void> _onSubcategoryTap(QuickOption subcategory) async {
//     await ref.read(chatMessagesProvider.notifier).selectSubcategory(subcategory);
//     _scrollToBottom();
//   }
//
//   Future<void> _onQuestionTap(QuickOption question) async {
//     await ref.read(chatMessagesProvider.notifier).selectQuestion(question);
//     _scrollToBottom();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//
//     // Scroll down every time a new message actually lands — not just once
//     // after the whole provider call finishes. This is what makes the answer
//     // and the follow-up chip list each get a visible moment on screen
//     // instead of the final scroll landing past the answer.
//     ref.listen(chatMessagesProvider, (previous, next) {
//       if (next.length > (previous?.length ?? 0)) {
//         _scrollToBottom();
//       }
//     });
//
//     final messages = ref.watch(chatMessagesProvider);
//     final isTyping = ref.watch(chatIsTypingProvider);
//
//     return AppBackground(
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: TopBar(l10n: l10n),
//         resizeToAvoidBottomInset: true,
//         body: SafeArea(
//           top: false,
//           child: Column(
//             children: [
//               Expanded(
//                 child: Stack(
//                   children: [
//                     // Persistent background graphic — stays visible behind
//                     // the conversation instead of disappearing once chat starts.
//                     Center(
//                       child: Opacity(
//                         opacity: 0.18,
//                         child: Image.asset(
//                           'assets/images/app_logo.png',
//                          // width: 200,
//                           //height: 200,
//                         ),
//                       ),
//                     ),
//                     ListView.builder(
//                       controller: _scrollCtrl,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: AppSpacing.md,
//                         vertical: AppSpacing.md,
//                       ),
//                       itemCount: messages.length + (isTyping ? 1 : 0),
//                       itemBuilder: (context, index) {
//                         if (isTyping && index == messages.length) {
//                           return const _TypingIndicator();
//                         }
//                         final msg = messages[index];
//                         return _MessageBubble(
//                           message: msg,
//                           onCategoryTap: _onCategoryTap,
//                           onSubcategoryTap: _onSubcategoryTap,
//                           onQuestionTap: _onQuestionTap,
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               _ChatInputBar(
//                 controller: _inputCtrl,
//                 onSend: _sendMessage,
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: const AppBottomNavBar(currentIndex: 3),
//       ),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────────
// // Message bubble (+ optional chips for category/question options)
// // ─────────────────────────────────────────────────────────────────────────────
// class _MessageBubble extends StatelessWidget {
//   final ChatMessage message;
//   final void Function(QuickOption) onCategoryTap;
//   final void Function(QuickOption) onSubcategoryTap;
//   final void Function(QuickOption) onQuestionTap;
//
//   const _MessageBubble({
//     required this.message,
//     required this.onCategoryTap,
//     required this.onSubcategoryTap,
//     required this.onQuestionTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final isUser = message.sender == MessageSender.user;
//     final timeStr =
//         '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')} '
//         '${message.timestamp.hour >= 12 ? 'PM' : 'AM'}';
//
//     return Padding(
//       padding: const EdgeInsets.only(bottom: AppSpacing.md),
//       child: Column(
//         crossAxisAlignment:
//         isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment:
//             isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               if (!isUser) ...[
//                 Container(
//                   width: 32,
//                   height: 32,
//                   child: Image.asset('assets/icons/chatbotprofile.png'),
//                 ),
//                 const SizedBox(width: AppSpacing.sm),
//               ],
//               Flexible(
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: AppSpacing.md,
//                     vertical: AppSpacing.sm,
//                   ),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFEEEEEE),
//                     borderRadius: BorderRadius.only(
//                       topLeft: const Radius.circular(AppSpacing.radiusLg),
//                       topRight: const Radius.circular(AppSpacing.radiusLg),
//                       bottomLeft:
//                       Radius.circular(isUser ? AppSpacing.radiusLg : 0),
//                       bottomRight:
//                       Radius.circular(isUser ? 0 : AppSpacing.radiusLg),
//                     ),
//                   ),
//                   child: Text(
//                     message.text,
//                     style: AppTypography.bodyMedium,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 4),
//           Padding(
//             padding: EdgeInsets.only(left: isUser ? 0 : 40),
//             child: Text(
//               timeStr,
//               style: AppTypography.bodySmall.copyWith(fontSize: 11),
//             ),
//           ),
//           if (message.options.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.only(top: AppSpacing.sm, left: 40),
//               child: _OptionChips(
//                 options: message.options,
//                 onTap: switch (message.contentType) {
//                   MessageContentType.categoryOptions => onCategoryTap,
//                   MessageContentType.subcategoryOptions => onSubcategoryTap,
//                   _ => onQuestionTap,
//                 },
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────────
// // Tappable chip list for categories / questions
// // ─────────────────────────────────────────────────────────────────────────────
// class _OptionChips extends StatelessWidget {
//   final List<QuickOption> options;
//   final void Function(QuickOption) onTap;
//
//   const _OptionChips({required this.options, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: AppSpacing.sm,
//       runSpacing: AppSpacing.sm,
//       children: options.map((opt) {
//         return GestureDetector(
//           onTap: () => onTap(opt),
//           child: Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: AppSpacing.md,
//               vertical: AppSpacing.sm,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
//               border: Border.all(color: AppColors.hintText.withOpacity(0.4)),
//             ),
//             child: Text(
//               opt.label,
//               style: AppTypography.bodyMedium.copyWith(
//                 color: AppColors.hintText,
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────────
// // Typing indicator
// // ─────────────────────────────────────────────────────────────────────────────
// class _TypingIndicator extends StatelessWidget {
//   const _TypingIndicator();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: AppSpacing.md),
//       child: Row(
//         children: [
//           Container(
//             width: 32,
//             height: 32,
//             child: Image.asset('assets/icons/chatbotprofile.png'),
//           ),
//           const SizedBox(width: AppSpacing.sm),
//           Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: AppSpacing.md,
//               vertical: AppSpacing.sm,
//             ),
//             decoration: BoxDecoration(
//               color: const Color(0xFFEEEEEE),
//               borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
//             ),
//             child: const _TypingDots(),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _TypingDots extends StatefulWidget {
//   const _TypingDots();
//
//   @override
//   State<_TypingDots> createState() => _TypingDotsState();
// }
//
// class _TypingDotsState extends State<_TypingDots>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _ctrl;
//   late Animation<double> _anim;
//
//   @override
//   void initState() {
//     super.initState();
//     _ctrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 900),
//     )..repeat();
//     _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
//   }
//
//   @override
//   void dispose() {
//     _ctrl.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _anim,
//       builder: (_, __) {
//         return Row(
//           mainAxisSize: MainAxisSize.min,
//           children: List.generate(3, (i) {
//             final delay = i / 3;
//             final value = (((_anim.value - delay) % 1.0 + 1.0) % 1.0);
//             final opacity = value < 0.5 ? value * 2 : (1 - value) * 2;
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 2),
//               child: Opacity(
//                 opacity: opacity.clamp(0.3, 1.0),
//                 child: Container(
//                   width: 7,
//                   height: 7,
//                   decoration: const BoxDecoration(
//                     color: AppColors.hintText,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             );
//           }),
//         );
//       },
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────────
// // Input bar
// // ─────────────────────────────────────────────────────────────────────────────
// class _ChatInputBar extends StatelessWidget {
//   final TextEditingController controller;
//   final Future<void> Function(String) onSend;
//
//   const _ChatInputBar({required this.controller, required this.onSend});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(
//         AppSpacing.md,
//         AppSpacing.sm,
//         AppSpacing.md,
//         AppSpacing.xl,
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
//               height: 60,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFFF5F4),
//                 borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
//               ),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () => onSend(controller.text),
//                     child: Container(
//                       width: 40,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         gradient: AppColors.primaryButtonGradient,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Image.asset('assets/icons/mic.png'),
//                     ),
//                   ),
//                   const SizedBox(width: AppSpacing.md),
//                   Expanded(
//                     child: TextField(
//                       controller: controller,
//                       style: AppTypography.bodyMedium,
//                       textInputAction: TextInputAction.send,
//                       onSubmitted: onSend,
//                       decoration: InputDecoration(
//                         hintText: 'Type a message....',
//                         hintStyle: AppTypography.bodyLarge,
//                         border: InputBorder.none,
//                         isDense: true,
//                         contentPadding: const EdgeInsets.symmetric(
//                           vertical: AppSpacing.sm,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: AppSpacing.xxl),
//                   GestureDetector(
//                     onTap: () => onSend(controller.text),
//                     child: Icon(Icons.send_rounded,
//                         color: AppColors.hintText, size: 25),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/chatbot/data/model/chatbot_model.dart';
import 'package:sangwari_maa/features/chatbot/presentation/provider/chatbot_provider.dart';
import 'package:sangwari_maa/shared/widgets/app_background.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';

class ChatbotScreen extends ConsumerStatefulWidget {
  const ChatbotScreen({super.key});

  @override
  ConsumerState<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends ConsumerState<ChatbotScreen> {
  final TextEditingController _inputCtrl = TextEditingController();
  final ScrollController _scrollCtrl = ScrollController();

  @override
  void dispose() {
    _inputCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    _inputCtrl.clear();
    await ref.read(chatMessagesProvider.notifier).sendUserMessage(text);
  }

  Future<void> _onCategoryTap(QuickOption category) async {
    await ref.read(chatMessagesProvider.notifier).selectCategory(category);
  }

  Future<void> _onSubcategoryTap(QuickOption subcategory) async {
    await ref.read(chatMessagesProvider.notifier).selectSubcategory(subcategory);
  }

  Future<void> _onQuestionTap(QuickOption question) async {
    await ref.read(chatMessagesProvider.notifier).selectQuestion(question);
  }

  void _onYesNoTap(QuickOption option) {
    ref.read(chatMessagesProvider.notifier).selectYesNo(option);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;


    final messages = ref.watch(chatMessagesProvider);
    final isTyping = ref.watch(chatIsTypingProvider);

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TopBar(l10n: l10n),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    // Persistent background graphic — stays visible behind
                    // the conversation instead of disappearing once chat starts.
                    Center(
                      child: Opacity(
                        opacity: 0.18,
                        child: Image.asset(
                          'assets/images/app_logo.png',
                        //  width: 200,
                        //  height: 200,
                        ),
                      ),
                    ),
                    ListView.builder(
                      controller: _scrollCtrl,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.md,
                      ),
                      itemCount: messages.length + (isTyping ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (isTyping && index == messages.length) {
                          return const _TypingIndicator();
                        }
                        final msg = messages[index];
                        return _MessageBubble(
                          message: msg,
                          onCategoryTap: _onCategoryTap,
                          onSubcategoryTap: _onSubcategoryTap,
                          onQuestionTap: _onQuestionTap,
                          onYesNoTap: _onYesNoTap,
                        );
                      },
                    ),
                  ],
                ),
              ),
              _ChatInputBar(
                controller: _inputCtrl,
                onSend: _sendMessage,
              ),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavBar(currentIndex: 3),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Message bubble (+ optional chips for category/question options)
// ─────────────────────────────────────────────────────────────────────────────
class _MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final void Function(QuickOption) onCategoryTap;
  final void Function(QuickOption) onSubcategoryTap;
  final void Function(QuickOption) onQuestionTap;
  final void Function(QuickOption) onYesNoTap;

  const _MessageBubble({
    required this.message,
    required this.onCategoryTap,
    required this.onSubcategoryTap,
    required this.onQuestionTap,
    required this.onYesNoTap,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == MessageSender.user;
    final timeStr =
        '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')} '
        '${message.timestamp.hour >= 12 ? 'PM' : 'AM'}';

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment:
        isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isUser) ...[
                Container(
                  width: 32,
                  height: 32,
                  child: Image.asset('assets/icons/chatbotprofile.png'),
                ),
                const SizedBox(width: AppSpacing.sm),
              ],
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(AppSpacing.radiusLg),
                      topRight: const Radius.circular(AppSpacing.radiusLg),
                      bottomLeft:
                      Radius.circular(isUser ? AppSpacing.radiusLg : 0),
                      bottomRight:
                      Radius.circular(isUser ? 0 : AppSpacing.radiusLg),
                    ),
                  ),
                  child: Text(
                    message.text,
                    style: AppTypography.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(left: isUser ? 0 : 40),
            child: Text(
              timeStr,
              style: AppTypography.bodySmall.copyWith(fontSize: 11),
            ),
          ),
          if (message.options.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.sm, left: 40),
              child: _OptionChips(
                options: message.options,
                onTap: switch (message.contentType) {
                  MessageContentType.categoryOptions => onCategoryTap,
                  MessageContentType.subcategoryOptions => onSubcategoryTap,
                  MessageContentType.yesNoOptions => onYesNoTap,
                  _ => onQuestionTap,
                },
              ),
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tappable chip list for categories / questions
// ─────────────────────────────────────────────────────────────────────────────
class _OptionChips extends StatelessWidget {
  final List<QuickOption> options;
  final void Function(QuickOption) onTap;

  const _OptionChips({required this.options, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: options.map((opt) {
        return GestureDetector(
          onTap: () => onTap(opt),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
              border: Border.all(color: AppColors.hintText.withOpacity(0.4)),
            ),
            child: Text(
              opt.label,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.hintText,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Typing indicator
// ─────────────────────────────────────────────────────────────────────────────
class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            child: Image.asset('assets/icons/chatbotprofile.png'),
          ),
          const SizedBox(width: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            ),
            child: const _TypingDots(),
          ),
        ],
      ),
    );
  }
}

class _TypingDots extends StatefulWidget {
  const _TypingDots();

  @override
  State<_TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<_TypingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final delay = i / 3;
            final value = (((_anim.value - delay) % 1.0 + 1.0) % 1.0);
            final opacity = value < 0.5 ? value * 2 : (1 - value) * 2;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Opacity(
                opacity: opacity.clamp(0.3, 1.0),
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: AppColors.hintText,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Input bar
// ─────────────────────────────────────────────────────────────────────────────
class _ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final Future<void> Function(String) onSend;

  const _ChatInputBar({required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.xl,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5F4),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => onSend(controller.text),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryButtonGradient,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/icons/mic.png'),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: AppTypography.bodyMedium,
                      textInputAction: TextInputAction.send,
                      onSubmitted: onSend,
                      decoration: InputDecoration(
                        hintText: 'Type a message....',
                        hintStyle: AppTypography.bodyLarge,
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.sm,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xxl),
                  GestureDetector(
                    onTap: () => onSend(controller.text),
                    child: Icon(Icons.send_rounded,
                        color: AppColors.hintText, size: 25),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}