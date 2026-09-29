import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/data/model/bpcr_facility_model.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_providers.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_answers_providers.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/facility_card.dart';

class HealthFacilityIdPage extends ConsumerStatefulWidget {
  const HealthFacilityIdPage({super.key});

  @override
  ConsumerState<HealthFacilityIdPage> createState() => _HealthFacilityIdPageState();
}

class _HealthFacilityIdPageState extends ConsumerState<HealthFacilityIdPage> {
  final _searchCtrl = TextEditingController();
  Timer? _debounce;

  // Captured once per screen visit, so "dirty" (= Save enabled) means
  // "different from what's on the server right now", not "any selection
  // exists". Re-seeded whenever the underlying async data first loads.
  Set<String>? _initialSelectedIds;
  String? _initialDeliveryFacilityId;
  bool _deliverySeeded = false;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchCtrl.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      ref.read(facilitySearchQueryProvider.notifier).set(value.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final facilitiesAsync = ref.watch(bpcrFacilitiesProvider);
    final selectedIds = ref.watch(bpcrFacilitySelectionProvider);
    final isSearching = ref.watch(facilitySearchQueryProvider).isNotEmpty;
    final deliveryAsync = ref.watch(deliveryFacilityAnswerProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            BpcrSectionHeader(iconAsset: 'assets/icons/bpcr5.png', title: l10n.bpcr_health_facility_title),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: TextField(
                controller: _searchCtrl,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: l10n.bpcr_search_facility_hint,
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color(0xFFF2F2F2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: facilitiesAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text(l10n.bpcr_facilities_load_error)),
                data: (data) {
                  // Seed the "what's actually saved" snapshot once per load
                  // of fresh server data (this runs again after a
                  // successful save, since save() invalidates the
                  // provider — so the snapshot always reflects reality).
                  _initialSelectedIds ??= data.selected.map((f) => f.id).toSet();

                  final byId = <String, BpcrFacilityModel>{
                    for (final f in [...data.catchment, ...data.results, ...data.selected]) f.id: f,
                  };
                  final selectedFacilities = selectedIds.map((id) => byId[id]).whereType<BpcrFacilityModel>().toList();

                  return deliveryAsync.when(
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text(l10n.bpcr_facilities_load_error)),
                    data: (deliveryId) {
                      if (!_deliverySeeded) {
                        _deliverySeeded = true;
                        _initialDeliveryFacilityId = deliveryId;
                      }
                      final facilitiesDirty = !_setEquals(selectedIds, _initialSelectedIds!);
                      final deliveryDirty = deliveryId != _initialDeliveryFacilityId;
                      final isDirty = facilitiesDirty || deliveryDirty;

                      return Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(
                                AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.lg,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (!isSearching) ...[
                                    // ── Saved facilities — always visible ──
                                    Text(l10n.bpcr_saved_facilities, style: AppTypography.titleMedium),
                                    const SizedBox(height: AppSpacing.sm),
                                    if (selectedFacilities.isEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: AppSpacing.md),
                                        child: Text(l10n.bpcr_no_facilities_saved_yet,
                                            style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText)),
                                      )
                                    else
                                      ...selectedFacilities.map((f) => Padding(
                                        padding: const EdgeInsets.only(bottom: AppSpacing.md),
                                        child: FacilityCard(
                                          facility: f.copyWith(isSelected: true),
                                          isSelected: true,
                                          onToggleSelect: () =>
                                              ref.read(bpcrFacilitySelectionProvider.notifier).toggle(f.id),
                                        ),
                                      )),
                                    const SizedBox(height: AppSpacing.lg),
                                    const Divider(),
                                    const SizedBox(height: AppSpacing.md),

                                    // ── Her catchment, to add more ──
                                    Text(l10n.bpcr_your_health_facilities, style: AppTypography.titleMedium),
                                    const SizedBox(height: AppSpacing.sm),
                                    if (data.catchment.isEmpty)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                                        child: Text(l10n.bpcr_no_catchment_facility,
                                            style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText)),
                                      )
                                    else
                                      ...data.catchment.map((f) => Padding(
                                        padding: const EdgeInsets.only(bottom: AppSpacing.md),
                                        child: FacilityCard(
                                          facility: f,
                                          isSelected: selectedIds.contains(f.id),
                                          onToggleSelect: () =>
                                              ref.read(bpcrFacilitySelectionProvider.notifier).toggle(f.id),
                                        ),
                                      )),

                                    // ── Where is she planning to deliver ──
                                    const SizedBox(height: AppSpacing.lg),
                                    const Divider(),
                                    const SizedBox(height: AppSpacing.md),
                                    Text(l10n.bpcr_delivery_place_question, style: AppTypography.titleMedium),
                                    const SizedBox(height: AppSpacing.xs),
                                    if (selectedFacilities.isEmpty)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                                        child: Text(l10n.bpcr_select_facility_first_hint,
                                            style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                                      )
                                    else
                                      ...selectedFacilities.map((f) => _DeliveryFacilityRadioRow(
                                        facility: f,
                                        selected: deliveryId == f.id,
                                        onTap: () => ref.read(deliveryFacilityAnswerProvider.notifier)
                                            .set(deliveryId == f.id ? null : f.id),
                                      )),
                                  ] else ...[
                                    Text('${data.results.length} ${l10n.bpcr_facilities_found}', style: AppTypography.bodyMedium),
                                    const SizedBox(height: AppSpacing.md),
                                    ...data.results.map((f) => Padding(
                                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                                      child: FacilityCard(
                                        facility: f,
                                        isSelected: selectedIds.contains(f.id),
                                        onToggleSelect: () =>
                                            ref.read(bpcrFacilitySelectionProvider.notifier).toggle(f.id),
                                      ),
                                    )),
                                  ],
                                ],
                              ),
                            ),
                          ),
                          if (!isSearching)
                            Padding(
                              padding: const EdgeInsets.all(AppSpacing.md),
                              child: AppPrimaryButton(
                                label: l10n.save,
                                onTap: !isDirty ? null : () async {
                                  final selOk = facilitiesDirty
                                      ? await ref.read(bpcrFacilitySelectionProvider.notifier).save()
                                      : true;
                                  final delOk = deliveryDirty
                                      ? await ref.read(deliveryFacilityAnswerProvider.notifier).save()
                                      : true;
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text((selOk && delOk) ? l10n.bpcr_facilities_saved : l10n.bpcr_facilities_save_error),
                                    ));
                                    if (selOk && delOk) {
                                      setState(() {
                                        _initialSelectedIds = null; // re-seed from the refreshed data next build
                                        _deliverySeeded = false;
                                      });
                                    }
                                  }
                                },
                              ),
                            ),
                        ],
                      );
                    },
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

bool _setEquals(Set<String> a, Set<String> b) => a.length == b.length && a.containsAll(b);

class _DeliveryFacilityRadioRow extends StatelessWidget {
  final BpcrFacilityModel facility;
  final bool selected;
  final VoidCallback onTap;
  const _DeliveryFacilityRadioRow({required this.facility, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(children: [
          Icon(selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? AppColors.gradStart : AppColors.hintText, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text('${facility.facilityType} — ${facility.name}', style: AppTypography.bodyLarge)),
        ]),
      ),
    );
  }
}