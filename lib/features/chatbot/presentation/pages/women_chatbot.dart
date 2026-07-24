
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
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
import 'package:sangwari_maa/shared/providers/locale_provider.dart';

class ChatbotScreen extends ConsumerStatefulWidget {
  const ChatbotScreen({super.key});

  @override
  ConsumerState<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends ConsumerState<ChatbotScreen> {
  final TextEditingController _inputCtrl = TextEditingController();
  final ScrollController _scrollCtrl = ScrollController();
  final FlutterTts _tts = FlutterTts();
  bool _lastInputWasVoice = false;

  @override
  void initState() {
    super.initState();
    _tts.setSpeechRate(0.5);
    _tts.setVolume(1.0);
    _tts.setLanguage('hi-IN'); // default; overridden per message in _speak()
  }

  @override
  void dispose() {
    _tts.stop();
    _inputCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _onVoiceSent() {
    setState(() => _lastInputWasVoice = true);
  }

  // Splits text into sentences and speaks each one so long responses
  // aren't silently cut off by Android's ~400 char TTS limit per utterance.
  Future<void> _speak(String text, String languageCode) async {
    await _tts.stop();
    await _tts.setLanguage(languageCode == 'hi' ? 'hi-IN' : 'en-IN');
    final sentences = text
        .split(RegExp(r'(?<=[।.!?])\s+'))
        .where((s) => s.trim().isNotEmpty)
        .toList();
    if (sentences.isEmpty) {
      await _tts.speak(text);
      return;
    }
    for (final sentence in sentences) {
      await _tts.awaitSpeakCompletion(true);
      await _tts.speak(sentence.trim());
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollCtrl.hasClients) {
        _scrollCtrl.animateTo(
          _scrollCtrl.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
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

    // Scroll only when an actual answer (a plain bot text bubble — not a
    // chip list, not the user's own echoed message) lands, so the user
    // sees the answer arrive without being auto-scrolled on every tap.
    ref.listen(chatMessagesProvider, (previous, next) {
      if (next.length > (previous?.length ?? 0)) {
        final latest = next.last;
        final isPlainBotAnswer = latest.sender == MessageSender.bot &&
            latest.contentType == MessageContentType.text;
        if (isPlainBotAnswer) {
          _scrollToBottom();
          if (_lastInputWasVoice) {
            final locale = ref.read(localeProvider);
            _speak(latest.text, locale.languageCode);
          }
          setState(() => _lastInputWasVoice = false);
        }
      }
    });

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
              // if (messages.isNotEmpty)
              //   InkWell(
              //     onTap: () => ref.read(chatMessagesProvider.notifier).refresh(),
              //     child: Container(
              //       width: double.infinity,
              //       padding: const EdgeInsets.symmetric(
              //         vertical: 6,
              //         horizontal: AppSpacing.md,
              //       ),
              //       color: AppColors.hintText.withOpacity(0.07),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Icon(Icons.refresh_rounded,
              //               size: 14, color: AppColors.hintText),
              //           const SizedBox(width: 4),
              //           Text(
              //             l10n.chatbotRefresh,
              //             style: AppTypography.bodySmall.copyWith(
              //               color: AppColors.hintText,
              //               fontSize: 11,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () =>
                      ref.read(chatMessagesProvider.notifier).refresh(),
                  child: Stack(
                    children: [
                      // Persistent background graphic — stays visible behind
                      // the conversation instead of disappearing once chat starts.
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.22,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Opacity(
                            opacity: 0.18,
                            child: Image.asset(
                              'assets/images/app_logo.png',
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        controller: _scrollCtrl,
                        physics: const AlwaysScrollableScrollPhysics(),
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
              ),
              if (messages.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.xs,
                  ),
                  child: GestureDetector(
                    onTap: () => ref
                        .read(chatMessagesProvider.notifier)
                        .showCategories(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(AppSpacing.radiusLg),
                        border: Border.all(
                            color: AppColors.hintText.withOpacity(0.4)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.menu_book_rounded,
                              size: 16, color: AppColors.hintText),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            l10n.chatbotBrowseTopics,
                            style: AppTypography.bodyMedium
                                .copyWith(color: AppColors.hintText),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              _ChatInputBar(
                controller: _inputCtrl,
                onSend: _sendMessage,
                l10n: l10n,
                onVoiceSent: _onVoiceSent,
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
class _ChatInputBar extends StatefulWidget {
  final TextEditingController controller;
  final Future<void> Function(String) onSend;
  final AppLocalizations l10n;
  final VoidCallback onVoiceSent;

  const _ChatInputBar({
    required this.controller,
    required this.onSend,
    required this.l10n,
    required this.onVoiceSent,
  });

  @override
  State<_ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<_ChatInputBar>
    with SingleTickerProviderStateMixin {
  final SpeechToText _stt = SpeechToText();
  bool _isListening = false;
  bool _hasSent = false; // guard against doneStatus firing twice on Android
  late AnimationController _pulseCtrl;
  late Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _pulseAnim = Tween<double>(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut),
    );
  }

  Future<void> _toggleListening() async {
    if (_isListening) {
      await _stt.stop();
      setState(() => _isListening = false);
      _pulseCtrl.stop();
      _pulseCtrl.reset();
      // Send whatever was transcribed so far
      final text = widget.controller.text.trim();
      if (text.isNotEmpty && !_hasSent) {
        _hasSent = true;
        widget.onVoiceSent();
        widget.controller.clear();
        await widget.onSend(text);
      }
      return;
    }

    final available = await _stt.initialize(
      onError: (_) {
        setState(() => _isListening = false);
        _pulseCtrl.stop();
        _pulseCtrl.reset();
      },
      onStatus: (status) {
        // 'done' fires when the user stops speaking — auto-send then.
        if (status == SpeechToText.doneStatus) {
          setState(() => _isListening = false);
          _pulseCtrl.stop();
          _pulseCtrl.reset();
          final text = widget.controller.text.trim();
          if (text.isNotEmpty && !_hasSent) {
            _hasSent = true;
            widget.onVoiceSent();
            widget.controller.clear();
            widget.onSend(text);
          }
        }
      },
    );

    if (!available) return;

    // Locale: use Hindi locale on Hindi, English otherwise.
    // 'hi_IN' is the BCP-47 tag Android/iOS both understand.
    final localeId = widget.l10n.localeName == 'hi' ? 'hi_IN' : 'en_IN';

    setState(() => _isListening = true);
    _hasSent = false;
    _pulseCtrl.repeat(reverse: true);
    await _stt.listen(
      onResult: (result) {
        if (_hasSent) return; // onResult fires async — ignore after send
        widget.controller.text = result.recognizedWords;
        widget.controller.selection = TextSelection.fromPosition(
          TextPosition(offset: widget.controller.text.length),
        );
      },
      localeId: localeId,
      pauseFor: const Duration(seconds: 3),
      listenFor: const Duration(seconds: 30),
    );
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    _stt.stop();
    super.dispose();
  }

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
                    onTap: _toggleListening,
                    child: ScaleTransition(
                      scale: _isListening ? _pulseAnim : const AlwaysStoppedAnimation(1.0),
                      child: Container(
                        width: 40,
                        height: 40,

                        child: _isListening
                            ? Image.asset('assets/icons/mic.png')
                            : Image.asset('assets/icons/mic.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      style: AppTypography.bodyMedium,
                      textInputAction: TextInputAction.send,
                      onSubmitted: widget.onSend,
                      decoration: InputDecoration(
                        hintText: _isListening
                            ? widget.l10n.chatbotListening
                            : widget.l10n.chatbotPlaceholder,
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
                    onTap: () {
                      final text = widget.controller.text;
                      widget.controller.clear();
                      widget.onSend(text);
                    },
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
