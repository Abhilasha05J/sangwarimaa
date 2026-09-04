import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_form_providers.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/facility_card.dart';

class HealthFacilityIdPage extends ConsumerWidget {
  const HealthFacilityIdPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final facilities = ref.watch(nearbyFacilitiesProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            BpcrSectionHeader(iconAsset: 'assets/icons/bpcr5.png', title: l10n.bpcr_health_facility_title),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Placeholder map — swap for google_maps_flutter once
                    // facility GPS master data + API key are confirmed.
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                      ),
                      child: const Center(
                        child: Icon(Icons.map_outlined, size: 48, color: AppColors.hintText),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text('${facilities.length} ${l10n.bpcr_facilities_found}', style: AppTypography.bodyMedium),
                    const SizedBox(height: AppSpacing.md),
                    ...facilities.map((f) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: FacilityCard(
                        facility: f,
                        onNavigate: () {
                          // TODO: launch maps URL once url_launcher is added.
                        },
                        onServices: () {
                          // TODO: launch Services.
                        }
                      ),
                    )),
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