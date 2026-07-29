import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_danger_signs_provider.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
import 'package:sangwari_maa/features/bpcr/data/model/danger_sign_card_data.dart';
import 'danger_sign_card.dart';

class BpcrChecklistScaffold extends ConsumerWidget {
  final String componentKey;
  final IconData headerIcon;
  final String headerTitle;
  final List<DangerSignCardData> cards;
  final VoidCallback onSubmitted;

  const BpcrChecklistScaffold({
    super.key,
    required this.componentKey,
    required this.headerIcon,
    required this.headerTitle,
    required this.cards,
    required this.onSubmitted,
  });

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selection = ref.watch(bpcrDangerSignsSelectionProvider(componentKey));
    final isComplete = selection.length == cards.length;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardGap = AppSpacing.md;
    final pairWidth = (screenWidth - AppSpacing.md * 2 - cardGap) / 2;
    // NOTE: no `fullWidth` here — every card, including a lone odd one,
    // renders at pairWidth and gets centered by Wrap below.

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            _SubHeader(icon: headerIcon, title: headerTitle),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: cardGap,
                  runSpacing: cardGap,
                  children: List.generate(cards.length, (i) {
                    return SizedBox(
                      width: pairWidth,
                      child: DangerSignCard(
                        data: cards[i],
                        isSelected: selection.contains(i),
                        onTap: () => ref
                            .read(bpcrDangerSignsSelectionProvider(componentKey).notifier)
                            .toggle(i),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.pop(),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.pinkText),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                        ),
                      ),
                      child: Text(
                        l10n.bpcr_back,
                        style: AppTypography.titleMedium.copyWith(color: AppColors.pinkText),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: AppPrimaryButton(
                      label: l10n.bpcr_submit,
                      onTap: isComplete ? onSubmitted : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}

class _SubHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  const _SubHeader({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFFCE4E4),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Icon(icon, color: AppColors.riskRed, size: 22),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(title, style: AppTypography.titleLarge)),
        ],
      ),
    );
  }
}