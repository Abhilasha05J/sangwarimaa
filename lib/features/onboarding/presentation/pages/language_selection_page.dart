import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/providers/locale_provider.dart';
import 'package:sangwari_maa/shared/widgets/app_background.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';

/// Screen — Language Selection.
///
/// Displays two radio tiles (English / हिंदी).
/// Selecting a language updates the app locale via [LocaleNotifier].
/// "Register here" button navigates to /register.

/// Route: /language
class LanguageSelectionPage extends ConsumerWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    final isEnglish = currentLocale.languageCode == 'en';
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/language_selection.svg',
              width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
             // height: 200,
            ),
            //const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenH,
                vertical: AppSpacing.lg,
              ),
              child: Column(
                children: [
                  // ── Title
                  Text(
                    l10n.languageTitle,
                    style: AppTypography.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  // ── Subtitle ─────────────────────────────────────────────
                  Text(
                    l10n.chooseLanguage,
                    style: AppTypography.bodyMedium
                        .copyWith(color: AppColors.hintText),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.xl),

                  // ── Language tiles ───────────────────────────────────────
                  _LanguageRadioTile(
                    label: 'English',
                    selected: isEnglish,
                    onTap: () => ref
                        .read(localeProvider.notifier)
                        .setLocale(const Locale('en')),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _LanguageRadioTile(
                    label: 'हिंदी',
                    selected: !isEnglish,
                    onTap: () => ref
                        .read(localeProvider.notifier)
                        .setLocale(const Locale('hi')),
                  ),

                  const SizedBox(height: 70),

                  // ── CTA ───────────────────────────────────────────────────
                  AppPrimaryButton(
                    label: l10n.registerHere,
                    showArrow: false,
                    onTap: () => context.pushNamed('register'),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Single language radio tile.
/// Border turns pink and radio fills when [selected] is true.
class _LanguageRadioTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _LanguageRadioTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '$label language option',
      selected: selected,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            border: Border.all(
              color: selected ? AppColors.pinkBorder : AppColors.greyBorder,
              width: selected ? 1.5 : 1.0,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            children: [
              Text(
                label,
                style: AppTypography.titleMedium.copyWith(
                  color: selected ? AppColors.pinkText : AppColors.bodyText,
                ),
              ),
              const Spacer(),
              _RadioDot(selected: selected),
            ],
          ),
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  final bool selected;
  const _RadioDot({required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? AppColors.pinkBorder : AppColors.hintText,
          width: 2,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.pinkBorder,
                ),
              ),
            )
          : null,
    );
  }
}
