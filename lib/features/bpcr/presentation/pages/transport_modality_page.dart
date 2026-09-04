import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_form_providers.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_yes_no_checkbox_pair.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';
import 'package:sangwari_maa/shared/widgets/app_text_field.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';
class TransportModalityPage extends ConsumerStatefulWidget {
  const TransportModalityPage({super.key});

  @override
  ConsumerState<TransportModalityPage> createState() => _TransportModalityPageState();
}

class _TransportModalityPageState extends ConsumerState<TransportModalityPage> {
  final _hospitalNameCtrl = TextEditingController();
  final _ambulanceContactCtrl = TextEditingController();
  final _privateProviderCtrl = TextEditingController();
  final _privateContactCtrl = TextEditingController();
  final _driverNameCtrl = TextEditingController();
  final _driverNumberCtrl = TextEditingController();
  final _companionNameCtrl = TextEditingController();
  final _companionContactCtrl = TextEditingController();
  final _companionRelationCtrl = TextEditingController();

  @override
  void dispose() {
    for (final c in [
      _hospitalNameCtrl, _ambulanceContactCtrl, _privateProviderCtrl,
      _privateContactCtrl, _driverNameCtrl, _driverNumberCtrl,
      _companionNameCtrl, _companionContactCtrl, _companionRelationCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final place = ref.watch(deliveryPlaceSelectionProvider);
    final option = ref.watch(transportOptionSelectionProvider);
    final sharedWithFamily = ref.watch(ambulanceSharedWithFamilyProvider);
    final ownVehicle = ref.watch(ownVehicleSelectionProvider);
    final companion = ref.watch(birthCompanionSelectionProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            BpcrSectionHeader(iconAsset: 'assets/icons/bpcr7.png', title: l10n.bpcr_transport_title),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.bpcr_transport_plan_subtitle, style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText)),
                    const SizedBox(height: AppSpacing.lg),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(color: const Color(0xFFFCEDEC), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(l10n.bpcr_delivery_place_question, style: AppTypography.titleMedium),
                          const SizedBox(height: AppSpacing.sm),
                          _RadioRow(label: l10n.bpcr_place_government, selected: place == DeliveryPlaceChoice.government, onTap: () => ref.read(deliveryPlaceSelectionProvider.notifier).set(DeliveryPlaceChoice.government)),
                          _RadioRow(label: l10n.bpcr_place_private, selected: place == DeliveryPlaceChoice.private, onTap: () => ref.read(deliveryPlaceSelectionProvider.notifier).set(DeliveryPlaceChoice.private)),
                          _RadioRow(label: l10n.bpcr_place_undecided, selected: place == DeliveryPlaceChoice.undecided, onTap: () => ref.read(deliveryPlaceSelectionProvider.notifier).set(DeliveryPlaceChoice.undecided)),
                          const SizedBox(height: AppSpacing.sm),
                          AppTextField(
                            label: l10n.bpcr_hospital_name_label,
                            hint: l10n.bpcr_hospital_name_hint,
                            controller: _hospitalNameCtrl,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    Text(l10n.bpcr_transport_options_label, style: AppTypography.titleMedium),
                    const SizedBox(height: AppSpacing.sm),

                    _RadioRow(
                      label: l10n.bpcr_option_government_ambulance,
                      selected: option == TransportOptionChoice.governmentAmbulance,
                      onTap: () => ref.read(transportOptionSelectionProvider.notifier).set(TransportOptionChoice.governmentAmbulance),
                    ),
                    if (option == TransportOptionChoice.governmentAmbulance) ...[
                      const SizedBox(height: AppSpacing.sm),
                      Text(l10n.bpcr_shared_with_family_question, style: AppTypography.bodyMedium),
                      const SizedBox(height: AppSpacing.xs),
                      BpcrYesNoCheckboxPair(value: sharedWithFamily, onChanged: (v) => ref.read(ambulanceSharedWithFamilyProvider.notifier).set(v!)),
                    ],

                    const SizedBox(height: AppSpacing.md),
                    _RadioRow(
                      label: l10n.bpcr_option_private_ambulance,
                      selected: option == TransportOptionChoice.privateAmbulance,
                      onTap: () => ref.read(transportOptionSelectionProvider.notifier).set(TransportOptionChoice.privateAmbulance),
                    ),
                    if (option == TransportOptionChoice.privateAmbulance) ...[
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(hint: l10n.bpcr_provider_name_hint, controller: _privateProviderCtrl),
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(hint: l10n.bpcr_contact_hint, controller: _privateContactCtrl, keyboardType: TextInputType.phone),
                    ],

                    const SizedBox(height: AppSpacing.md),
                    _RadioRow(
                      label: l10n.bpcr_option_own_vehicle,
                      selected: option == TransportOptionChoice.ownVehicle,
                      onTap: () => ref.read(transportOptionSelectionProvider.notifier).set(TransportOptionChoice.ownVehicle),
                    ),
                    if (option == TransportOptionChoice.ownVehicle) ...[
                      const SizedBox(height: AppSpacing.sm),
                      Wrap(spacing: AppSpacing.md, children: [
                        _ChipChoice(label: l10n.bpcr_vehicle_car, selected: ownVehicle == OwnVehicleType.car, onTap: () => ref.read(ownVehicleSelectionProvider.notifier).set(OwnVehicleType.car)),
                        _ChipChoice(label: l10n.bpcr_vehicle_bike, selected: ownVehicle == OwnVehicleType.bike, onTap: () => ref.read(ownVehicleSelectionProvider.notifier).set(OwnVehicleType.bike)),
                        _ChipChoice(label: l10n.bpcr_vehicle_other, selected: ownVehicle == OwnVehicleType.other, onTap: () => ref.read(ownVehicleSelectionProvider.notifier).set(OwnVehicleType.other)),
                      ]),
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(hint: l10n.bpcr_driver_name_hint, controller: _driverNameCtrl),
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(hint: l10n.bpcr_driver_number_hint, controller: _driverNumberCtrl, keyboardType: TextInputType.phone),
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
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _ChipChoice(label: l10n.bpcr_companion_asha, selected: companion == BirthCompanionChoice.asha, onTap: () => ref.read(birthCompanionSelectionProvider.notifier).set(BirthCompanionChoice.asha)),
                                _ChipChoice(label: l10n.bpcr_companion_husband, selected: companion == BirthCompanionChoice.husband, onTap: () => ref.read(birthCompanionSelectionProvider.notifier).set(BirthCompanionChoice.husband)),
                                _ChipChoice(label: l10n.bpcr_companion_other_family, selected: companion == BirthCompanionChoice.otherFamily, onTap: () => ref.read(birthCompanionSelectionProvider.notifier).set(BirthCompanionChoice.otherFamily)),
                              ]
                          ),
                          if (companion == BirthCompanionChoice.otherFamily) ...[
                            const SizedBox(height: AppSpacing.sm),
                            AppTextField(hint: l10n.bpcr_name_hint, controller: _companionNameCtrl),
                            const SizedBox(height: AppSpacing.sm),
                            AppTextField(hint: l10n.bpcr_contact_hint, controller: _companionContactCtrl, keyboardType: TextInputType.phone),
                            const SizedBox(height: AppSpacing.sm),
                            AppTextField(hint: l10n.bpcr_relation_hint, controller: _companionRelationCtrl),
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
                  child: AppPrimaryButton(
                    label: l10n.save,
                    onTap: place != null && option != null ? () => context.pop() : null,
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



