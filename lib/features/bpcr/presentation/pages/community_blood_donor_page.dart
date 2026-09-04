import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_info_banner.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';

class CommunityBloodDonorPage extends ConsumerWidget {
  const CommunityBloodDonorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            BpcrSectionHeader(iconAsset: 'assets/icons/bpcr10.png', title: l10n.bpcr_blood_donor_title),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BpcrInfoBanner(text: l10n.bpcr_blood_donor_reminder_quote),
                    const SizedBox(height: AppSpacing.lg),
                    // Single card now — no IntrinsicHeight/Row/Expanded
                    // needed, that was only there to height-match a second
                    // sibling card that's since been removed.
                    _StatCard(
                      label: l10n.bpcr_self_blood_group_label,
                      value: 'O+',
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.bpcr_family_donors_label, style: AppTypography.titleMedium.copyWith(color: AppColors.pinkText)),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(foregroundColor: AppColors.riskGreen),
                          child: Text(
                            l10n.bpcr_add_family_member,
                            style: const TextStyle(color: AppColors.riskGreen, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    _DonorRow(name: 'Rajesh Kumar', detail: 'Brother • O Positive'),
                    _DonorRow(name: 'Ayush Kumar', detail: 'Cousin • O Positive'),
                    const SizedBox(height: AppSpacing.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.bpcr_community_donors_label, style: AppTypography.titleMedium.copyWith(color: AppColors.pinkText)),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(foregroundColor: AppColors.riskGreen),
                          child: Text(
                            l10n.bpcr_add_community_donors,
                            style: const TextStyle(color: AppColors.riskGreen, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const _CommunityDonorRow(),
                    const _CommunityDonorRow(),
                    const SizedBox(height: AppSpacing.lg),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String? footnote;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _StatCard({required this.label, required this.value, this.footnote, this.actionLabel, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: const Color(0xFFFCEDEC), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.titleMedium),
          const SizedBox(height: 6),
          Text(value, style: AppTypography.headlineMedium.copyWith(color: AppColors.riskRed, fontSize: 18)),
          if (footnote != null) ...[
            const SizedBox(height: 6),
            Text(footnote!, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
          ],
          if (actionLabel != null) ...[
            const SizedBox(height: AppSpacing.sm),
            OutlinedButton(
              onPressed: onAction,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.riskGreen),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
              ),
              child: Text(actionLabel!, style: const TextStyle(color: AppColors.riskGreen)),
            ),
          ],
        ],
      ),
    );
  }
}

class _DonorRow extends StatelessWidget {
  final String name;
  final String detail;
  const _DonorRow({required this.name, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppTypography.titleMedium),
              Text(detail, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
            ],
          ),
          Container(
            width: 36,
            height: 36,
            child: Image.asset('assets/icons/callemer.png'),
          ),
        ],
      ),
    );
  }
}

class _CommunityDonorRow extends StatelessWidget {
  const _CommunityDonorRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plain label now — no trailing Spacer, since there's no
          // "Available Now"/"Not Available" text to push to the right
          // anymore.
          Text('O Positive', style: AppTypography.titleMedium.copyWith(color: AppColors.riskRed)),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amit Singh', style: AppTypography.bodyMedium),
                    Text('Sector 33, Street 12, Raipur (2.4 Km)', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                    Text('0987654321', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Container(
                width: 36,
                height: 36,
                child: Image.asset('assets/icons/callemer.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}