
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/widgets/app_background.dart';
import 'package:sangwari_maa/shared/widgets/app_logo_header.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';


/// Route: /  (initial route before onboarding is complete)
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    // Read MediaQuery once — avoids repeated lookups on every rebuild
    final mq = MediaQuery.sizeOf(context);
   // final padding = MediaQuery.paddingOf(context);
    final screenH = mq.height;
    final logoHeight = (screenH * 0.20).clamp(100.0, 200.0);

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: AppBackground(
          child:Stack(
            children: [
              // ── Watermark Background ─────────────────────────
              Positioned.fill(
                child: Opacity(
                  opacity: 0.20,
                  child: Image.asset(
                    'assets/images/bg1.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SafeArea(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.screenH),
                      sliver: SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            SizedBox(height: screenH * 0.20),

                            // ── Logo ───────────────────────────────────────
                            AppLogoHeader(
                              width: double.infinity,
                              height: logoHeight,
                            ),

                            SizedBox(height: screenH * 0.01),

                            // ── Bilingual tagline ───────────────────────────
                            _BilingualTagline(l10n: l10n),

                            const Spacer(),

                            // ── CTA ─────────────────────────────────────────
                            AppPrimaryButton(
                              label: l10n.splashStart,
                              showArrow: false,
                              onTap: () => context.pushNamed('language'),
                            ),

                            SizedBox(height: screenH * 0.04),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )

        ),
      ),
    );
  }
}

class _BilingualTagline extends StatelessWidget {
  final AppLocalizations l10n;
  const _BilingualTagline({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // English tagline
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Sangwari ',
                style: AppTypography.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.sangwari,
                ),
              ),
              TextSpan(
                text: 'MAA ',
                style: AppTypography.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.maa,
                ),
              ),
              TextSpan(
                text:
                'is a reliable pregnancy companion, providing timely guidance, '
                    'reminders, and alerts to support informed decisions and ensure '
                    'a safe, confident maternal journey.',
                style: AppTypography.bodyLarge,
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Hindi tagline
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'संगवारी ',
                style: AppTypography.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.sangwari,
                ),
              ),
              TextSpan(
                text: 'MAA ',
                style: AppTypography.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.maa,
                ),
              ),
              TextSpan(
                text:
                'एक भरोसेमंद गर्भावस्था साथी है, जो समय पर मार्गदर्शन, '
                    'रिमाइंडर और चेतावनी देकर सुरक्षित और जागरूक मातृत्व यात्रा '
                    'सुनिश्चित करती है',
                style: AppTypography.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}



