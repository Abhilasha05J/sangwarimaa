import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';

class BpcrScreen extends ConsumerWidget {
  const BpcrScreen({super.key});

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
            // ── Sub header with back arrow ────────────────────────────────
            _SubHeader(
              title: 'BPCR',
              onBack: () => context.pop(),
            ),

            // ── Scrollable content ───────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.md,
                ),
                child: Column(
                  children: [
                    // Row 1: Danger signs during pregnancy / labor & childbirth
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: _BpcrTile(
                              iconAsset: 'assets/icons/bpcr1.png',
                              title: '${l10n.bpcr_danger_pregnancy_title}',
                              subtitle:
                              '${l10n.bpcr_danger_pregnancy_desc}',
                              onTap: () =>
                                  context.pushNamed('dangerSignsPregnancy'),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: _BpcrTile(
                              iconAsset: 'assets/icons/bpcr2.png',
                              title: '${l10n.bpcr_danger_labor_title}',
                              subtitle:
                              '${l10n.bpcr_danger_labor_desc}',
                              onTap: () =>
                                  context.pushNamed('dangerSignsLabor'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Row 2: Danger signs postnatal / labor & childbirth (newborn)
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: _BpcrTile(
                              iconAsset: 'assets/icons/bpcr3.png',
                              title: '${l10n.bpcr_postnatal_title}',
                              subtitle:
                              '${l10n.bpcr_postnatal_desc}',
                              onTap: () =>
                                  context.pushNamed('dangerSignsPostnatal'),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: _BpcrTile(
                              iconAsset: 'assets/icons/bpcr4.png',
                              title: '${l10n.bpcr_newborn_title}',
                              subtitle:
                              '${l10n.bpcr_newborn_desc}',
                              onTap: () =>
                                  context.pushNamed('dangerSignsNewborn'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Health facility identification — full width, green
                    _BpcrFullWidthTile(
                      iconAsset: 'assets/icons/bpcr5.png',
                      title: '${l10n.bpcr_health_facility_title}',
                      backgroundColor: const Color(0xFFE3F2E5),
                      iconBgColor: const Color(0xFF43A047),
                      onTap: () => context.pushNamed('healthFacilityId'),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Row 3: Identified skill birth attendant / Transport modality
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: _BpcrTile(
                              iconAsset: 'assets/icons/bpcr6.png',
                              title: '${l10n.bpcr_skill_birth_attendant_title}',
                              subtitle: '',
                              onTap: () =>
                                  context.pushNamed('skillBirthAttendant'),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: _BpcrTile(
                              iconAsset: 'assets/icons/bpcr7.png',
                              title:
                              '${l10n.bpcr_danger_pregnancy_title}',
                              subtitle: '${l10n.bpcr_transport_desc}',
                              onTap: () =>
                                  context.pushNamed('transportModality'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Row 4: Saved money / Community financial support
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: _BpcrTile(
                              iconAsset: 'assets/icons/bpcr8.png',
                              title: '${l10n.bpcr_save_money_title}',
                              subtitle: '',
                              onTap: () =>
                                  context.pushNamed('savedMoneyDelivery'),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: _BpcrTile(
                              iconAsset: 'assets/icons/bpcr9.png',
                              title:
                              '${l10n.bpcr_financial_support_title}',
                              subtitle: '${l10n.bpcr_financial_support_desc}',
                              onTap: () =>
                                  context.pushNamed('communityFinancialSupport'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Identify community blood donor — full width, red
                    _BpcrFullWidthTile(
                      iconAsset: 'assets/icons/bpcr10.png',
                      title: '${l10n.bpcr_blood_donor_title}',
                      backgroundColor: const Color(0xFFFCE4E4),
                      iconBgColor: const Color(0xFFE53935),
                      onTap: () => context.pushNamed('communityBloodDonor'),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0,),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sub header (back arrow + title) — light blue strip under TopBar
// ─────────────────────────────────────────────────────────────────────────────
class _SubHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const _SubHeader({required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFE8F1FB),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.bodyText,
              size: 22,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(title, style: AppTypography.titleLarge.copyWith(fontSize: 18)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Standard 2-column grey tile with icon + title + subtitle + chevron
// ─────────────────────────────────────────────────────────────────────────────
class _BpcrTile extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _BpcrTile({
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(iconAsset, fit: BoxFit.contain),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.hintText,
                  size: 22,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              title,
              style: AppTypography.titleMedium.copyWith(fontSize: 15),
            ),
            if (subtitle.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                subtitle,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.hintText,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Full-width colored tile (Health facility / Blood donor)
// ─────────────────────────────────────────────────────────────────────────────
class _BpcrFullWidthTile extends StatelessWidget {
  final String iconAsset;
  final String title;
  final Color backgroundColor;
  final Color iconBgColor;
  final VoidCallback onTap;

  const _BpcrFullWidthTile({
    required this.iconAsset,
    required this.title,
    required this.backgroundColor,
    required this.iconBgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(iconAsset, fit: BoxFit.contain),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                title,
                style: AppTypography.titleMedium.copyWith(fontSize: 16),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.hintText,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}