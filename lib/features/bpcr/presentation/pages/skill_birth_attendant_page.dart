import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/data/model/bpcr_sba_model.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_providers.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';

class SkillBirthAttendantPage extends ConsumerWidget {
  const SkillBirthAttendantPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final sbaAsync = ref.watch(bpcrSbaProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            BpcrSectionHeader(iconAsset: 'assets/icons/bpcr6.png', title: l10n.bpcr_skill_birth_attendant_title),
            Expanded(
              child: sbaAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text(l10n.bpcr_sba_load_error)),
                data: (data) {
                  if (data.facilities.isEmpty) {
                    return _EmptyState(
                      message: l10n.bpcr_no_facility_selected,
                      ctaLabel: l10n.bpcr_select_facility_cta,
                      onTap: () => context.pushNamed('healthFacilityId'),
                    );
                  }
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.lg,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...data.facilities.map((f) => Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                          child: _FacilitySbaSection(item: f),
                        )),
                        if (data.asha != null) ...[
                          Text(l10n.bpcr_asha_mitanin_label, style: AppTypography.titleMedium),
                          const SizedBox(height: AppSpacing.sm),
                          _StaffCard(
                            roleLabel: 'ASHA/MITANIN',
                            name: data.asha!.name,
                            mobile: data.asha!.mobile,
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}

class _FacilitySbaSection extends StatelessWidget {
  final SbaFacilityModel item;
  const _FacilitySbaSection({required this.item});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Expanded(child: Text(item.facility.name, style: AppTypography.titleMedium)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
            child: Text(item.facility.facilityType, style: AppTypography.bodySmall),
          ),
        ]),
        if (item.noDirectSbaData) ...[
          const SizedBox(height: 4),
          Text(
            item.groups.isEmpty
                ? l10n.bpcr_no_sba_data_for_facility
                : l10n.bpcr_sba_available_via_shc,
            style: AppTypography.bodySmall.copyWith(color: AppColors.hintText, fontStyle: FontStyle.italic),
          ),
        ],
        const SizedBox(height: AppSpacing.sm),
        if (item.groups.isEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Text(l10n.bpcr_no_sba_data_for_facility, style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText)),
          )
        else
          ...item.groups.map((g) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item.staffViaChildFacilities)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      g.isOwnVillageShc
                          ? '${g.shcName} (${l10n.bpcr_your_village_shc})'
                          : g.shcName,
                      style: AppTypography.bodySmall.copyWith(color: AppColors.pinkText, fontWeight: FontWeight.w600),
                    ),
                  ),
                ...g.staff.map((s) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: _StaffCard(roleLabel: s.roleLabel, name: s.name, mobile: s.mobile),
                )),
              ],
            ),
          )),
      ],
    );
  }
}

class _StaffCard extends StatelessWidget {
  final String roleLabel;
  final String? name;
  final String? mobile;
  const _StaffCard({required this.roleLabel, required this.name, required this.mobile});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isVacant = name == null;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: const Color(0xFFC0C0C0)),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(color: const Color(0xFFFCE4E4), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
                  child: Text(roleLabel, style: AppTypography.bodySmall.copyWith(color: AppColors.riskRed, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(isVacant ? l10n.bpcr_post_vacant : name!, style: AppTypography.titleMedium),
                if (!isVacant && mobile == null) ...[
                  const SizedBox(height: 2),
                  Text(l10n.bpcr_number_unavailable, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                ],
              ],
            ),
          ),
          if (mobile != null)
            GestureDetector(
              onTap: () {}, // TODO: url_launcher tel: once added
              child: SizedBox(width: 40, height: 40, child: Image.asset('assets/icons/callemer.png')),
            ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;
  final String ctaLabel;
  final VoidCallback onTap;
  const _EmptyState({required this.message, required this.ctaLabel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center, style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText)),
            const SizedBox(height: AppSpacing.md),
            OutlinedButton(onPressed: onTap, child: Text(ctaLabel)),
          ],
        ),
      ),
    );
  }
}
