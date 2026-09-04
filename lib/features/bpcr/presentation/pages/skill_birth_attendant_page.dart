import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_form_providers.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/contact_person_card.dart';

class SkillBirthAttendantPage extends ConsumerWidget {
  const SkillBirthAttendantPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final sbas = ref.watch(skilledBirthAttendantsProvider);
    final asha = ref.watch(ashaContactProvider);
    final tbas = ref.watch(tbaContactsProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            BpcrSectionHeader(iconAsset: 'assets/icons/bpcr6.png', title: l10n.bpcr_skill_birth_attendant_title),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...sbas.map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: ContactPersonCard(data: s, onCall: () {}, onGetDirection: () {}),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: ContactPersonCard(data: asha, onCall: () {}, onAltCall: () {}, onGetDirection: () {}),
                    ),
                    // SBA/TBA is fetched data, not a manual toggle — render
                    // whatever came back, and simply show nothing if the
                    // village has no TBA on record.
                    ...tbas.map((t) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: ContactPersonCard(data: t, onCall: () {}, onGetDirection: () {}),
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