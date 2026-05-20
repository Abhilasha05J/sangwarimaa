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

/// Route: /language
class LanguageSelectionPage extends ConsumerWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    final isEnglish = currentLocale.languageCode == 'en';
    final l10n = AppLocalizations.of(context)!;
    // MediaQuery.sizeOf / paddingOf are cheaper — they only rebuild when
    // size / padding change, not on every MediaQuery change (e.g. keyboard).
    final screenH = MediaQuery.sizeOf(context).height;
    final bottomPad = MediaQuery.paddingOf(context).bottom;

    // Illustration: at most 45 % of screen height, min 160 px
    final illustrationH = (screenH * 0.45).clamp(160.0, 320.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        // CustomScrollView + SliverFillRemaining replaces the
        // SingleChildScrollView + ConstrainedBox + IntrinsicHeight triple.
        // IntrinsicHeight forces a double layout pass on every frame — it is
        // the primary cause of frame skips on the language → register push.
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              // SVG is pre-decoded by flutter_svg; explicit width/height lets
              // the engine skip a measure pass.
              child: SvgPicture.asset(
                'assets/images/language_selection.svg',
                width: double.infinity,
                height: illustrationH,
                fit: BoxFit.cover,
              ),
            ),
            SliverFillRemaining(
              // hasScrollBody: false → child fills leftover space; Column's
              // Spacer() works correctly. No ConstrainedBox / IntrinsicHeight.
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenH,
                  vertical: AppSpacing.lg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ── Title ────────────────────────────────────────────
                    Text(
                      l10n.languageTitle,
                      style: AppTypography.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                   // const SizedBox(height: AppSpacing.xs),

                    // ── Subtitle ──────────────────────────────────────────
                    Text(
                      l10n.chooseLanguage,
                      style: AppTypography.bodyMedium
                          .copyWith(color: AppColors.hintText),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.lg),

                    // ── Language tiles ────────────────────────────────────
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

                    const Spacer(),

                    // ── CTA ───────────────────────────────────────────────
                    AppPrimaryButton(
                      label: l10n.registerHere,
                      showArrow: false,
                      onTap: () => context.pushNamed('register'),
                    ),
                    //SizedBox(height: AppSpacing.xs + bottomPad),
                    SizedBox(height: screenH * 0.02),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Single language radio tile.
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
      child: SizedBox(
        height: 56,
        child: Material(
          // A non-transparent color is required so Material's hit-test box
          // covers the full SizedBox area, not just the border pixels.
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            splashColor: AppColors.pinkBorder.withOpacity(0.08),
            highlightColor: AppColors.pinkBorder.withOpacity(0.04),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              // No height here — SizedBox above controls size.
              // Color is transparent so Material's white shows through and
              // the InkWell ripple is visible on top.
              decoration: BoxDecoration(
                color: Colors.transparent,
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
                      color: selected
                          ? AppColors.pinkText
                          : AppColors.bodyText,
                    ),
                  ),
                  const Spacer(),
                  _RadioDot(selected: selected),
                ],
              ),
            ),
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