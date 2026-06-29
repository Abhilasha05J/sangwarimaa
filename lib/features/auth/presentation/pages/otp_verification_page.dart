
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/auth/data/model/user_model.dart';
import 'package:sangwari_maa/features/auth/presentation/controller/auth_controller.dart';
import 'package:sangwari_maa/shared/widgets/app_background.dart';
import 'package:sangwari_maa/shared/widgets/app_logo_header.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';

/// Route: /login/otp
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
    // Reset auth state so the stale AsyncData from sendOtp (previous screen)
    // does not immediately fire ref.listen and blank/mis-navigate this screen.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.invalidate(authControllerProvider);
    });
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

  String get _otpValue => _controllers.map((c) => c.text).join();

  bool _isVerifying = false;

  void _onVerify() {
    final otp = _otpValue;
    if (otp.length < _otpLength) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context)!.invalidOtp)),
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
    ref.read(authControllerProvider.notifier).sendOtp(widget.mobile);
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final screenH = MediaQuery.sizeOf(context).height;
    final logoHeight = (screenH * 0.20).clamp(100.0, 180.0);

    ref.listen<AsyncValue<void>>(authControllerProvider, (previous, next) {
      // Only react when transitioning OUT of loading — prevents stale
      // AsyncData from sendOtp (LoginPage) from mis-navigating on mount.
      final wasLoading = previous?.isLoading ?? false;
      if (!wasLoading) return;

      next.whenOrNull(
        error: (e, _) {
          setState(() => _isVerifying = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        },
        data: (_) {
          if (!_isVerifying) return;
          final controller = ref.read(authControllerProvider.notifier);
          if (controller.isNewUser) {
            context.pushNamed('register', extra: widget.mobile);
            return;
          }
          switch (controller.role) {
            case UserRole.pregnantWoman:
              context.go('/womensdashboard');
              break;
            case UserRole.asha:
            case UserRole.anm:
              context.go('/mitanindashboard'); // ⚠️ route doesn't exist yet — see below
              break;
            case UserRole.blockAdmin:
            case UserRole.pi:
            case UserRole.superAdmin:
              context.go('/admindashboard'); // ⚠️ route doesn't exist yet — see below
              break;
            case null:
              context.go('/womensdashboard'); // fallback, shouldn't happen
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
            // SingleChildScrollView is required here because LayoutBuilder
            // (used for OTP box sizing) is incompatible with SliverFillRemaining:
            // Flutter asks SliverFillRemaining for intrinsic height, which forces
            // LayoutBuilder to run speculatively — it refuses and throws.
            // SingleChildScrollView + ConstrainedBox achieves the same
            // "fill viewport, scroll if needed" behaviour without intrinsics.
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenH -
                    MediaQuery.paddingOf(context).top -
                    MediaQuery.paddingOf(context).bottom -
                    MediaQuery.viewInsetsOf(context).bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenH * 0.06),

                  // ── Logo ─────────────────────────────────────────────
                  AppLogoHeader(
                    width: double.infinity,
                    height: logoHeight,
                  ),

                  SizedBox(height: screenH * 0.02),

                  // ── Header ────────────────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          l10n.loginTitle,
                          style: AppTypography.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: l10n.otpSentTo(widget.mobile),
                                style: AppTypography.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // ── Enter OTP label ───────────────────────────────────
                  Text(l10n.enterOtp, style: AppTypography.fieldLabel),
                  const SizedBox(height: AppSpacing.md),

                  // ── 6-digit OTP boxes ─────────────────────────────────
                  // LayoutBuilder is safe inside SingleChildScrollView —
                  // it is only incompatible with SliverFillRemaining.
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return _OtpInputRow(
                        controllers: _controllers,
                        focusNodes: _focusNodes,
                        otpLength: _otpLength,
                        availableWidth: constraints.maxWidth,
                      );
                    },
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // ── Verify OTP button ─────────────────────────────────
                  AppPrimaryButton(
                    label: l10n.verifyOtp,
                    isLoading: isLoading,
                    onTap: _onVerify,
                  ),

                  SizedBox(height: screenH * 0.02),

                  // ── Resend link ───────────────────────────────────────
                  Center(
                    child: GestureDetector(
                      onTap: _secondsLeft == 0 ? _onResend : null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppSpacing.md),
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
                  ),

                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Row of 6 OTP digit boxes.
/// [availableWidth] is used to compute each box width so they always fit.
class _OtpInputRow extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final int otpLength;
  final double availableWidth;

  const _OtpInputRow({
    required this.controllers,
    required this.focusNodes,
    required this.otpLength,
    required this.availableWidth,
  });

  @override
  Widget build(BuildContext context) {
    // Total gap between boxes (otpLength - 1 gaps of 8 px each)
    const gapTotal = 8.0 * (_otpLength - 1);
    // Box width: fill available space equally, clamped 40–54 px
    final boxWidth = ((availableWidth - gapTotal) / otpLength).clamp(40.0, 54.0);
    final boxHeight = boxWidth * 1.07; // slight portrait aspect

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(otpLength, (i) {
        return _OtpBox(
          controller: controllers[i],
          focusNode: focusNodes[i],
          width: boxWidth,
          height: boxHeight,
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

  // Keep the constant accessible inside the build method above.
  static const int _otpLength = 6;
}

class _OtpBox extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final double width;
  final double height;
  final void Function(String) onChanged;

  const _OtpBox({
    required this.controller,
    required this.focusNode,
    required this.width,
    required this.height,
    required this.onChanged,
  });

  @override
  State<_OtpBox> createState() => _OtpBoxState();
}

class _OtpBoxState extends State<_OtpBox> {
  // ListenableBuilder scopes the rebuild to only this single OTP box's
  // decoration, instead of setState which would rebuild the entire OTP row.
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.focusNode,
      builder: (_, __) => _buildBox(widget.focusNode.hasFocus),
    );
  }

  Widget _buildBox(bool isFocused) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppColors.fieldFill,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(
          color: isFocused ? AppColors.pinkBorder : const Color(0xFF9E9E9E),
          width: isFocused ? 1.5 : 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000), // Colors.black.withOpacity(0.08)
            blurRadius: 6,
            offset: Offset(0, 3),
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