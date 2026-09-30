import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_answers_providers.dart';
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
  bool _synced = false;
  bool _isSaving = false;

  @override
  void dispose() {
    _husbandNameCtrl.dispose();
    _husbandContactCtrl.dispose();
    _milNameCtrl.dispose();
    _milContactCtrl.dispose();
    _milRelationCtrl.dispose();
    super.dispose();
  }

  void _syncControllers(SavedMoneyDraft d) {
    if (_synced) return;
    _synced = true;
    _husbandNameCtrl.text = d.husbandName;
    _husbandContactCtrl.text = d.husbandContact;
    _milNameCtrl.text = d.milName;
    _milContactCtrl.text = d.milContact;
    _milRelationCtrl.text = d.milRelation;
  }

  Future<void> _save() async {
    if (_isSaving) return;
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppLocalizations.of(context)!;
    final router = GoRouter.of(context);

    setState(() => _isSaving = true);
    try {
      final ok = await ref.read(savedMoneyAnswersProvider.notifier).save();
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(
        content: Text(ok ? l10n.bpcr_saved : l10n.bpcr_answers_save_error),
      ));
      if (ok) router.pop();
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final draftAsync = ref.watch(savedMoneyAnswersProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: draftAsync.when(
          loading: () => const Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
          error: (e, _) => Center(child: Text(l10n.bpcr_answers_load_error)),
          data: (draft) {
            _syncControllers(draft);
            final notifier = ref.read(savedMoneyAnswersProvider.notifier);

            return Column(
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
                          value: draft.selfSaving,
                          onChanged: (v) => notifier.edit((d) => d.selfSaving = v),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        const Divider(),
                        const SizedBox(height: AppSpacing.md),
                        Text(l10n.bpcr_family_saving_label, style: AppTypography.titleMedium),
                        const SizedBox(height: AppSpacing.md),
                        _FamilyMemberCheckboxRow(
                          label: l10n.bpcr_husband_label,
                          checked: draft.husbandSelected,
                          onChanged: (_) => notifier.edit((d) => d.husbandSelected = !d.husbandSelected),
                        ),
                        if (draft.husbandSelected) ...[
                          const SizedBox(height: AppSpacing.sm),
                          AppTextField(hint: l10n.bpcr_name_hint, controller: _husbandNameCtrl,
                              onChanged: (v) => notifier.edit((d) => d.husbandName = v)),
                          const SizedBox(height: AppSpacing.sm),
                          AppTextField(hint: l10n.bpcr_contact_hint, controller: _husbandContactCtrl, keyboardType: TextInputType.phone,
                              onChanged: (v) => notifier.edit((d) => d.husbandContact = v)),
                        ],
                        const SizedBox(height: AppSpacing.md),
                        _FamilyMemberCheckboxRow(
                          label: l10n.bpcr_mother_in_law_label,
                          checked: draft.milSelected,
                          onChanged: (_) => notifier.edit((d) => d.milSelected = !d.milSelected),
                        ),
                        if (draft.milSelected) ...[
                          const SizedBox(height: AppSpacing.sm),
                          AppTextField(hint: l10n.bpcr_name_hint, controller: _milNameCtrl,
                              onChanged: (v) => notifier.edit((d) => d.milName = v)),
                          const SizedBox(height: AppSpacing.sm),
                          AppTextField(hint: l10n.bpcr_contact_hint, controller: _milContactCtrl, keyboardType: TextInputType.phone,
                              onChanged: (v) => notifier.edit((d) => d.milContact = v)),
                          const SizedBox(height: AppSpacing.sm),
                          AppTextField(hint: l10n.bpcr_relation_hint, controller: _milRelationCtrl,
                              onChanged: (v) => notifier.edit((d) => d.milRelation = v)),
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
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radiusMd)), padding: const EdgeInsets.symmetric(vertical: 16)),
                        child: Text(l10n.bpcr_back, style: TextStyle(color: AppColors.pinkText)),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: _isSaving
                          ? const SizedBox(
                        height: 48,
                        child: Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
                      )
                          : AppPrimaryButton(
                        label: l10n.save,
                        onTap: draft.selfSaving != null ? _save : null,
                      ),
                    ),
                  ]),
                ),
              ],
            );
          },
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

  const _FamilyMemberCheckboxRow({required this.label, required this.checked, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!checked),
      child: Row(
        children: [
          SizedBox(
            width: 24, height: 24,
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
