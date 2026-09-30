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
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_yes_no_checkbox_pair.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';

class TransportModalityPage extends ConsumerStatefulWidget {
  const TransportModalityPage({super.key});

  @override
  ConsumerState<TransportModalityPage> createState() => _TransportModalityPageState();
}

class _TransportModalityPageState extends ConsumerState<TransportModalityPage> {
  final _privateProviderCtrl = TextEditingController();
  final _privateContactCtrl = TextEditingController();
  final _driverNameCtrl = TextEditingController();
  final _driverNumberCtrl = TextEditingController();
  final _companionNameCtrl = TextEditingController();
  final _companionContactCtrl = TextEditingController();
  final _companionRelationCtrl = TextEditingController();
  bool _synced = false;
  bool _isSaving = false;

  @override
  void dispose() {
    for (final c in [
      _privateProviderCtrl, _privateContactCtrl,
      _driverNameCtrl, _driverNumberCtrl,
      _companionNameCtrl, _companionContactCtrl, _companionRelationCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _syncControllers(TransportDraft d) {
    if (_synced) return;
    _synced = true;
    _privateProviderCtrl.text = d.privateProviderName;
    _privateContactCtrl.text = d.privateContact;
    _driverNameCtrl.text = d.driverName;
    _driverNumberCtrl.text = d.driverNumber;
    _companionNameCtrl.text = d.companionName;
    _companionContactCtrl.text = d.companionContact;
    _companionRelationCtrl.text = d.companionRelation;
  }

  Future<void> _save() async {
    if (_isSaving) return;
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppLocalizations.of(context)!;
    final router = GoRouter.of(context);

    setState(() => _isSaving = true);
    try {
      final ok = await ref.read(transportAnswersProvider.notifier).save();
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
    final draftAsync = ref.watch(transportAnswersProvider);

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
            final notifier = ref.read(transportAnswersProvider.notifier);

            return Column(
              children: [
                BpcrSectionHeader(iconAsset: 'assets/icons/bpcr7.png', title: l10n.bpcr_transport_title),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppSpacing.md),
                        Text(l10n.bpcr_transport_plan_subtitle, style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText)),
                        const SizedBox(height: AppSpacing.lg),
                        // Delivery-place question moved to the Health
                        // Facility ID screen — she picks it from her
                        // selected facilities there instead of typing a
                        // hospital name here.
                        Text(l10n.bpcr_transport_options_label, style: AppTypography.titleMedium),
                        const SizedBox(height: AppSpacing.sm),
                        _RadioRow(
                          label: l10n.bpcr_option_government_ambulance,
                          selected: draft.option == TransportOptionChoice.governmentAmbulance,
                          onTap: () => notifier.edit((d) => d.option = TransportOptionChoice.governmentAmbulance),
                        ),
                        if (draft.option == TransportOptionChoice.governmentAmbulance) ...[
                          const SizedBox(height: AppSpacing.sm),
                          Text(l10n.bpcr_shared_with_family_question, style: AppTypography.bodyMedium),
                          const SizedBox(height: AppSpacing.xs),
                          BpcrYesNoCheckboxPair(
                            value: draft.ambulanceSharedWithFamily,
                            onChanged: (v) => notifier.edit((d) => d.ambulanceSharedWithFamily = v),
                          ),
                        ],
                        const SizedBox(height: AppSpacing.md),
                        _RadioRow(
                          label: l10n.bpcr_option_private_ambulance,
                          selected: draft.option == TransportOptionChoice.privateAmbulance,
                          onTap: () => notifier.edit((d) => d.option = TransportOptionChoice.privateAmbulance),
                        ),
                        if (draft.option == TransportOptionChoice.privateAmbulance) ...[
                          const SizedBox(height: AppSpacing.sm),
                          AppTextField(hint: l10n.bpcr_provider_name_hint, controller: _privateProviderCtrl,
                              onChanged: (v) => notifier.edit((d) => d.privateProviderName = v)),
                          const SizedBox(height: AppSpacing.sm),
                          AppTextField(hint: l10n.bpcr_contact_hint, controller: _privateContactCtrl, keyboardType: TextInputType.phone,
                              onChanged: (v) => notifier.edit((d) => d.privateContact = v)),
                        ],
                        const SizedBox(height: AppSpacing.md),
                        _RadioRow(
                          label: l10n.bpcr_option_own_vehicle,
                          selected: draft.option == TransportOptionChoice.ownVehicle,
                          onTap: () => notifier.edit((d) => d.option = TransportOptionChoice.ownVehicle),
                        ),
                        if (draft.option == TransportOptionChoice.ownVehicle) ...[
                          const SizedBox(height: AppSpacing.sm),
                          Wrap(spacing: AppSpacing.md, children: [
                            _ChipChoice(label: l10n.bpcr_vehicle_car, selected: draft.ownVehicle == OwnVehicleType.car,
                                onTap: () => notifier.edit((d) => d.ownVehicle = OwnVehicleType.car)),
                            _ChipChoice(label: l10n.bpcr_vehicle_bike, selected: draft.ownVehicle == OwnVehicleType.bike,
                                onTap: () => notifier.edit((d) => d.ownVehicle = OwnVehicleType.bike)),
                            _ChipChoice(label: l10n.bpcr_vehicle_other, selected: draft.ownVehicle == OwnVehicleType.other,
                                onTap: () => notifier.edit((d) => d.ownVehicle = OwnVehicleType.other)),
                          ]),
                          const SizedBox(height: AppSpacing.sm),
                          AppTextField(hint: l10n.bpcr_driver_name_hint, controller: _driverNameCtrl,
                              onChanged: (v) => notifier.edit((d) => d.driverName = v)),
                          const SizedBox(height: AppSpacing.sm),
                          AppTextField(hint: l10n.bpcr_driver_number_hint, controller: _driverNumberCtrl, keyboardType: TextInputType.phone,
                              onChanged: (v) => notifier.edit((d) => d.driverNumber = v)),
                        ],
                        const SizedBox(height: AppSpacing.lg),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(color: const Color(0xFFFCEDEC), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.bpcr_identify_birth_companion_label, style: AppTypography.titleMedium),
                              const SizedBox(height: AppSpacing.sm),
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                _ChipChoice(label: l10n.bpcr_companion_asha, selected: draft.companion == BirthCompanionChoice.asha,
                                    onTap: () => notifier.edit((d) => d.companion = BirthCompanionChoice.asha)),
                                _ChipChoice(label: l10n.bpcr_companion_husband, selected: draft.companion == BirthCompanionChoice.husband,
                                    onTap: () => notifier.edit((d) => d.companion = BirthCompanionChoice.husband)),
                                _ChipChoice(label: l10n.bpcr_companion_other_family, selected: draft.companion == BirthCompanionChoice.otherFamily,
                                    onTap: () => notifier.edit((d) => d.companion = BirthCompanionChoice.otherFamily)),
                              ]),
                              if (draft.companion != null) ...[
                                const SizedBox(height: AppSpacing.sm),
                                Text(
                                  '${l10n.bpcr_your_birth_companion_label}: ${_companionLabel(l10n, draft.companion!)}',
                                  style: AppTypography.bodyMedium.copyWith(color: AppColors.riskGreen, fontWeight: FontWeight.w600),
                                ),
                              ],
                              if (draft.companion == BirthCompanionChoice.otherFamily) ...[
                                const SizedBox(height: AppSpacing.sm),
                                AppTextField(hint: l10n.bpcr_name_hint, controller: _companionNameCtrl,
                                    onChanged: (v) => notifier.edit((d) => d.companionName = v)),
                                const SizedBox(height: AppSpacing.sm),
                                AppTextField(hint: l10n.bpcr_contact_hint, controller: _companionContactCtrl, keyboardType: TextInputType.phone,
                                    onChanged: (v) => notifier.edit((d) => d.companionContact = v)),
                                const SizedBox(height: AppSpacing.sm),
                                AppTextField(hint: l10n.bpcr_relation_hint, controller: _companionRelationCtrl,
                                    onChanged: (v) => notifier.edit((d) => d.companionRelation = v)),
                              ],
                            ],
                          ),
                        ),
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
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.pinkText),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radiusMd)),
                        ),
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
                        onTap: draft.option != null ? _save : null,
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

  String _companionLabel(AppLocalizations l10n, BirthCompanionChoice c) => switch (c) {
    BirthCompanionChoice.asha => l10n.bpcr_companion_asha,
    BirthCompanionChoice.husband => l10n.bpcr_companion_husband,
    BirthCompanionChoice.otherFamily => l10n.bpcr_companion_other_family,
  };
}

class _RadioRow extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _RadioRow({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(children: [
          Icon(selected ? Icons.radio_button_checked : Icons.radio_button_off, color: selected ? AppColors.gradStart : AppColors.hintText, size: 20),
          const SizedBox(width: 8),
          Text(label, style: AppTypography.bodyLarge),
        ]),
      ),
    );
  }
}

class _ChipChoice extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _ChipChoice({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: AppColors.gradStart.withOpacity(0.2),
      labelStyle: TextStyle(color: selected ? AppColors.gradStart : AppColors.bodyText),
    );
  }
}