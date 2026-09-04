import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_yes_no_checkbox_pair.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_form_providers.dart';

class CommunityFinancialSupportPage extends ConsumerWidget {
  const CommunityFinancialSupportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final answers = ref.watch(communitySupportAnswersProvider);

    final rows = <(CommunitySupportType, String)>[
      (CommunitySupportType.panch, l10n.bpcr_support_panch),
      (CommunitySupportType.sarpanch, l10n.bpcr_support_sarpanch),
      (CommunitySupportType.healers, l10n.bpcr_support_healers),
      (CommunitySupportType.schoolTeachers, l10n.bpcr_support_school_teachers),
      (CommunitySupportType.other, l10n.bpcr_support_other),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            BpcrSectionHeader(iconAsset: 'assets/icons/bpcr9.png', title: l10n.bpcr_financial_support_title),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.bpcr_community_support_question, style: AppTypography.bodyLarge.copyWith(color: AppColors.riskRed)),
                      const SizedBox(height: AppSpacing.lg),
                      for (final (type, label) in rows) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(label, style: AppTypography.titleMedium.copyWith(color: AppColors.riskRed)),
                            BpcrYesNoCheckboxPair(
                              value: answers[type],
                              onChanged: (v) => ref.read(communitySupportAnswersProvider.notifier).set(type, v),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.md),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.pinkText),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radiusMd)), padding: const EdgeInsets.symmetric(vertical: 16)),
                    child: Text(l10n.bpcr_back, style: TextStyle(color: AppColors.pinkText)),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: AppPrimaryButton(
                    label: l10n.save,
                    onTap: () => context.pop(),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}