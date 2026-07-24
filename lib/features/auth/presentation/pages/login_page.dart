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

/// Route: /login
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _mobileCtrl = TextEditingController();
  bool _otpPushed = false;

  @override
  void dispose() {
    _mobileCtrl.dispose();
    super.dispose();
  }

  void _onGetOtp() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    _otpPushed = false;
    ref
        .read(authControllerProvider.notifier)
        .sendOtp(_mobileCtrl.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // sizeOf / paddingOf are O(1) and rebuild only on their specific change,
    // unlike MediaQuery.of(context) which rebuilds on ANY MediaQuery change.
    final size = MediaQuery.sizeOf(context);
    //final padding = MediaQuery.paddingOf(context);
    final screenH = size.height;
    final logoHeight = (screenH * 0.20).clamp(100.0, 180.0);

    // Listen for OTP sent success → navigate to OTP screen
    ref.listen<AsyncValue<void>>(authControllerProvider, (previous, next) {
      final wasLoading = previous?.isLoading ?? false; // ADD
      if (!wasLoading) return;
      if (_otpPushed) return;
      next.whenOrNull(
        error: (e, _) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        ),
        data: (_) {
          _otpPushed = true;
          context.pushNamed(
            'otp',
            extra: _mobileCtrl.text.trim(),
          );
        },
      );
    });

    final isLoading = ref.watch(authControllerProvider).isLoading;

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: CustomScrollView(
              // CustomScrollView + SliverFillRemaining replaces
              // SingleChildScrollView + ConstrainedBox + IntrinsicHeight.
              // Eliminates the double layout pass IntrinsicHeight requires.
              keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenH),
                  sliver: SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenH * 0.06),

                        // ── Logo ───────────────────────────────────────
                        AppLogoHeader(
                          width: double.infinity,
                          height: logoHeight,
                        ),

                        SizedBox(height: screenH * 0.02),

                        // ── Identity Verification title ─────────────────
                        _VerificationHeader(l10n: l10n),

                        const SizedBox(height: AppSpacing.xl),

                        // ── Mobile Number field ─────────────────────────
                        Text(l10n.mobileNumber,
                            style: AppTypography.fieldLabel),
                        const SizedBox(height: AppSpacing.sm),
                        AppTextField(
                          hint: l10n.enterMobileNumber,
                          controller: _mobileCtrl,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(AppSpacing.md),
                            child: Icon(
                              Icons.phone_android,
                              color: AppColors.hintText,
                              size: 20,
                            ),
                          ),
                          validator: (v) {
                            if (v == null || v.length != 10) {
                              return l10n.invalidMobile;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: AppSpacing.md),

                        // ── Get OTP button ──────────────────────────────
                        AppPrimaryButton(
                          label: l10n.sendOtp,
                          isLoading: isLoading,
                          onTap: _onGetOtp,
                        ),

                        // ── Flexible gap ────────────────────────────────
                        const Spacer(),

                        // ── Register link ───────────────────────────────
                        Center(
                          child: GestureDetector(
                            onTap: () => context.pushNamed('register'),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: AppSpacing.md),
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
                        ),

                        const SizedBox(height: AppSpacing.lg),
                      ],
                    ),
                  ),
                ),
              ],
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
        const Row(mainAxisAlignment: MainAxisAlignment.center),
        Text(
          l10n.loginTitle,
          style: AppTypography.titleLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}