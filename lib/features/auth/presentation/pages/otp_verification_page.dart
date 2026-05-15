import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/auth/presentation/controller/auth_controller.dart';
import 'package:sangwari_maa/shared/widgets/app_background.dart';
import 'package:sangwari_maa/shared/widgets/app_logo_header.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';

/// Screen 4 — OTP Verification.
///
/// 6 individual OTP digit boxes, auto-advance on each digit input.
/// 60-second resend countdown timer.
/// "Verify OTP" navigates to dashboard on success.
///
/// Route: /login/otp
/// Extra: String (mobile number)
class OtpVerificationPage extends ConsumerStatefulWidget {
  final String mobile;
  const OtpVerificationPage({super.key, required this.mobile});

  @override
  ConsumerState<OtpVerificationPage> createState() =>
      _OtpVerificationPageState();
}

class _OtpVerificationPageState extends ConsumerState<OtpVerificationPage> {
  static const int _otpLength = 6;
  static const int _resendSeconds = 60;

  final List<TextEditingController> _controllers =
      List.generate(_otpLength, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
      List.generate(_otpLength, (_) => FocusNode());

  late Timer _timer;
  int _secondsLeft = _resendSeconds;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsLeft = _resendSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft == 0) {
        t.cancel();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String get _otpValue =>
      _controllers.map((c) => c.text).join();

  bool _isVerifying = false;
  void _onVerify() {
    final otp = _otpValue;
    if (otp.length < _otpLength) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text(AppLocalizations.of(context)!.invalidOtp)),
      );
      return;
    }
    setState(() => _isVerifying = true);
    ref
        .read(authControllerProvider.notifier)
        .verifyOtp(widget.mobile, otp);
  }

  void _onResend() {
    if (_secondsLeft > 0) return;
    setState(() => _isVerifying = false);
    ref
        .read(authControllerProvider.notifier)
        .sendOtp(widget.mobile);
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    ref.listen<AsyncValue<void>>(authControllerProvider, (_, next) {
      next.whenOrNull(
        error: (e, _) {
          setState(() => _isVerifying = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        },
        data: (_) {
          if (_isVerifying) {
            context.go('/womensdashboard');
          }
        },
      );
    });

    final isLoading = ref.watch(authControllerProvider).isLoading;

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.xxl*2),

                  // ── Logo ──────────────────────────────────────────────
                   const AppLogoHeader(width: 500, height:180),

                  // ── Identity Verification title ───────────────────────
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(l10n.loginTitle,
                          style: AppTypography.titleLarge,
                          textAlign: TextAlign.center),
                      const SizedBox(height: AppSpacing.sm),

                      // OTP sent to mobile
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: l10n.otpSentTo(widget.mobile),
                              style: AppTypography.bodyMedium,
                            ),
                            // TextSpan(
                            //   text: widget.mobile,
                            //   style: AppTypography.linkText,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // ── Enter OTP label ────────────────────────────────────
                  Text(l10n.enterOtp, style: AppTypography.fieldLabel),
                  const SizedBox(height: AppSpacing.md),

                  // ── 6-digit OTP boxes ──────────────────────────────────
                  _OtpInputRow(
                    controllers: _controllers,
                    focusNodes: _focusNodes,
                    otpLength: _otpLength,
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // ── Verify OTP button ──────────────────────────────────
                  AppPrimaryButton(
                    label: l10n.verifyOtp,
                    isLoading: isLoading,
                    onTap: _onVerify,
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // ── Resend link ────────────────────────────────────────
                  Center(
                    child: GestureDetector(
                      onTap: _secondsLeft == 0 ? _onResend : null,
                      child: Text(
                        _secondsLeft > 0
                            ? l10n.resendOtpIn(_secondsLeft)
                            : l10n.resendOtp,
                        style: AppTypography.bodyMedium.copyWith(
                          color: _secondsLeft > 0
                              ? AppColors.hintText
                              : AppColors.pinkText,
                          fontWeight: _secondsLeft == 0
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
          ),
      ),
    );
  }
}

/// Row of 6 individual OTP digit boxes with auto-advance focus.
class _OtpInputRow extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final int otpLength;

  const _OtpInputRow({
    required this.controllers,
    required this.focusNodes,
    required this.otpLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(otpLength, (i) {
        return _OtpBox(
          controller: controllers[i],
          focusNode: focusNodes[i],
          onChanged: (v) {
            if (v.isNotEmpty && i < otpLength - 1) {
              focusNodes[i + 1].requestFocus();
            } else if (v.isEmpty && i > 0) {
              focusNodes[i - 1].requestFocus();
            }
          },
        );
      }),
    );
  }
}

class _OtpBox extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) onChanged;

  const _OtpBox({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  State<_OtpBox> createState() => _OtpBoxState();
}

class _OtpBoxState extends State<_OtpBox> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() => _isFocused = widget.focusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 58,
      decoration: BoxDecoration(
        color: AppColors.fieldFill,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(
          color: _isFocused ? AppColors.pinkBorder : const Color(0xFF9E9E9E),
          width: _isFocused ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: widget.onChanged,
        style: AppTypography.titleLarge,
        decoration: const InputDecoration(
          counterText: '',
          filled: false,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
