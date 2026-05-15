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
import 'package:sangwari_maa/shared/widgets/app_text_field.dart';

/// Screen 3 — Login (Mobile Number Entry).
///
/// User enters 10-digit mobile number and taps "Get OTP".
/// On success, navigates to OtpVerificationPage with the mobile number.
///
/// Route: /login
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _mobileCtrl = TextEditingController();

  @override
  void dispose() {
    _mobileCtrl.dispose();
    super.dispose();
  }

  void _onGetOtp() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    ref
        .read(authControllerProvider.notifier)
        .sendOtp(_mobileCtrl.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Listen for OTP sent success → navigate to OTP screen
    ref.listen<AsyncValue<void>>(authControllerProvider, (_, next) {
      next.whenOrNull(
        error: (e, _) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        ),
        data: (_) => context.pushNamed(
          'otp',
          extra: _mobileCtrl.text.trim(),
        ),
      );
    });

    final isLoading = ref.watch(authControllerProvider).isLoading;

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body :SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.xxl*2),

                    // ── Logo ─────────────────────────────────────────────
                    const AppLogoHeader(width: 500, height: 180),
                    //const SizedBox(height: AppSpacing.lg),
                    // ── Identity Verification title ───────────────────────
                    _VerificationHeader(l10n: l10n),
                    const SizedBox(height: AppSpacing.xl),

                    // ── Mobile Number field ───────────────────────────────
                    Text(l10n.mobileNumber, style: AppTypography.fieldLabel),
                    const SizedBox(height: AppSpacing.sm),
                    AppTextField(
                      hint: l10n.enterMobileNumber,
                      controller: _mobileCtrl,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Icon(Icons.phone_android,
                            color: AppColors.hintText, size: 20),
                      ),
                      validator: (v) {
                        if (v == null || v.length != 10) {
                          return l10n.invalidMobile;
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: AppSpacing.md),

                    // ── Get OTP button ────────────────────────────────────
                    AppPrimaryButton(
                      label: l10n.sendOtp,
                      isLoading: isLoading,
                      onTap: _onGetOtp,
                    ),

                    const SizedBox(height: AppSpacing.xxl *6),

                    // ── Register link ─────────────────────────────────────
                    Center(
                      child: GestureDetector(
                        onTap: () => context.pushNamed('register'),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${l10n.noAccount} ',
                                style: AppTypography.bodyMedium,
                              ),
                              TextSpan(
                                text: l10n.registerHere,
                                style: AppTypography.linkText,
                              ),
                            ],
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

class _VerificationHeader extends StatelessWidget {
  final AppLocalizations l10n;
  const _VerificationHeader({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // children: [
          //   const Icon(Icons.verified_user,
          //       color: AppColors.pinkText, size: 18),
          //   const SizedBox(width: AppSpacing.xs),
          //   Text(l10n.identityVerification, style: AppTypography.pinkLabel),
          // ],
        ),
        //const SizedBox(height: AppSpacing.xs),
        Text(
          l10n.loginTitle,
          style: AppTypography.titleLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
