import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_form_providers.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';
import 'package:sangwari_maa/shared/widgets/app_text_field.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_info_banner.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_yes_no_checkbox_pair.dart';

class SavedMoneyDeliveryPage extends ConsumerStatefulWidget {
  const SavedMoneyDeliveryPage({super.key});

  @override
  ConsumerState<SavedMoneyDeliveryPage> createState() => _SavedMoneyDeliveryPageState();
}

class _SavedMoneyDeliveryPageState extends ConsumerState<SavedMoneyDeliveryPage> {
  final _husbandNameCtrl = TextEditingController();
  final _husbandContactCtrl = TextEditingController();
  final _milNameCtrl = TextEditingController();
  final _milContactCtrl = TextEditingController();
  final _milRelationCtrl = TextEditingController();

  @override
  void dispose() {
    _husbandNameCtrl.dispose();
    _husbandContactCtrl.dispose();
    _milNameCtrl.dispose();
    _milContactCtrl.dispose();
    _milRelationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final selfSaving = ref.watch(selfSavingAnswerProvider);
    final husbandSelected = ref.watch(husbandSavingSelectedProvider);
    final milSelected = ref.watch(motherInLawSavingSelectedProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            BpcrSectionHeader(iconAsset: 'assets/icons/bpcr8.png', title: l10n.bpcr_save_money_title),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BpcrInfoBanner(text: l10n.bpcr_saving_reminder_quote),
                    const SizedBox(height: AppSpacing.lg),

                    Text(l10n.bpcr_self_saving_label, style: AppTypography.titleMedium),
                    const SizedBox(height: AppSpacing.sm),
                    BpcrYesNoCheckboxPair(
                      value: selfSaving,
                      onChanged: (v) => ref.read(selfSavingAnswerProvider.notifier).set(v),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const Divider(),
                    const SizedBox(height: AppSpacing.md),

                    Text(l10n.bpcr_family_saving_label, style: AppTypography.titleMedium),
                    const SizedBox(height: AppSpacing.md),

                    // Husband — single checkbox, reveals name+contact when checked.
                    _FamilyMemberCheckboxRow(
                      label: l10n.bpcr_husband_label,
                      checked: husbandSelected,
                      onChanged: (_) => ref.read(husbandSavingSelectedProvider.notifier).toggle(),
                    ),
                    if (husbandSelected) ...[
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(hint: l10n.bpcr_name_hint, controller: _husbandNameCtrl),
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(hint: l10n.bpcr_contact_hint, controller: _husbandContactCtrl, keyboardType: TextInputType.phone),
                    ],
                    const SizedBox(height: AppSpacing.md),

                    // Mother-in-law — same pattern.
                    _FamilyMemberCheckboxRow(
                      label: l10n.bpcr_mother_in_law_label,
                      checked: milSelected,
                      onChanged: (_) => ref.read(motherInLawSavingSelectedProvider.notifier).toggle(),
                    ),
                    if (milSelected) ...[
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(hint: l10n.bpcr_name_hint, controller: _milNameCtrl),
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(hint: l10n.bpcr_contact_hint, controller: _milContactCtrl, keyboardType: TextInputType.phone),
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(hint: l10n.bpcr_relation_hint, controller: _milRelationCtrl),
                    ],
                    const SizedBox(height: AppSpacing.lg),
                  ],
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radiusMd)),padding: const EdgeInsets.symmetric(vertical: 16)),
                    child: Text(l10n.bpcr_back, style: TextStyle(color: AppColors.pinkText)),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: AppPrimaryButton(
                    label: l10n.save,
                    onTap: selfSaving != null ? () => context.pop() : null,
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

class _FamilyMemberCheckboxRow extends StatelessWidget {
  final String label;
  final bool checked;
  final ValueChanged<bool?> onChanged;

  const _FamilyMemberCheckboxRow({
    required this.label,
    required this.checked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!checked),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: checked,
              onChanged: onChanged,
              activeColor: AppColors.gradStart,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
          ),
          const SizedBox(width: 8),
          Text(label, style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText)),
        ],
      ),
    );
  }
}