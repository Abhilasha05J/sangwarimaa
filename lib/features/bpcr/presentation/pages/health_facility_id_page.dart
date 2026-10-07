// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sangwari_maa/core/constants/app_colors.dart';
// import 'package:sangwari_maa/core/constants/app_spacing.dart';
// import 'package:sangwari_maa/core/constants/app_typography.dart';
// import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
// import 'package:sangwari_maa/features/bpcr/data/model/bpcr_facility_model.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_providers.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_answers_providers.dart';
// import 'package:sangwari_maa/shared/widgets/app_bar.dart';
// import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';
// import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/widgets/facility_card.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_nearest_providers.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/widgets/nearest_facilities_section.dart';
// class HealthFacilityIdPage extends ConsumerStatefulWidget {
//   const HealthFacilityIdPage({super.key});
//
//   @override
//   ConsumerState<HealthFacilityIdPage> createState() => _HealthFacilityIdPageState();
// }
//
// class _HealthFacilityIdPageState extends ConsumerState<HealthFacilityIdPage> {
//   final _searchCtrl = TextEditingController();
//   Timer? _debounce;
//
//   // Captured once per screen visit, so "dirty" (= Save enabled) means
//   // "different from what's on the server right now", not "any selection
//   // exists". Re-seeded whenever the underlying async data first loads.
//   Set<String>? _initialSelectedIds;
//   String? _initialDeliveryFacilityId;
//   bool _deliverySeeded = false;
//   bool _isSaving = false;
//
//   @override
//   void dispose() {
//     _debounce?.cancel();
//     _searchCtrl.dispose();
//     super.dispose();
//   }
//
//   void _onSearchChanged(String value) {
//     _debounce?.cancel();
//     _debounce = Timer(const Duration(milliseconds: 300), () {
//       ref.read(facilitySearchQueryProvider.notifier).set(value.trim());
//     });
//   }
//   Future<void> _save({required bool facilitiesDirty, required bool deliveryDirty}) async {
//     if (_isSaving) return;
//     setState(() => _isSaving = true);
//     try {
//       final selOk = facilitiesDirty
//           ? await ref.read(bpcrFacilitySelectionProvider.notifier).save()
//           : true;
//       final delOk = deliveryDirty
//           ? await ref.read(deliveryFacilityAnswerProvider.notifier).save()
//           : true;
//
//       if (!mounted) return;
//       final l10n = AppLocalizations.of(context)!;
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text((selOk && delOk) ? l10n.bpcr_saved : l10n.bpcr_facilities_save_error),
//       ));
//       if (selOk && delOk) {
//         setState(() {
//           _initialSelectedIds = null; // re-seed from the refreshed data next build
//           _deliverySeeded = false;
//         });
//       }
//     } finally {
//       if (mounted) setState(() => _isSaving = false);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//     final facilitiesAsync = ref.watch(bpcrFacilitiesProvider);
//     final selectedIds = ref.watch(bpcrFacilitySelectionProvider);
//     final isSearching = ref.watch(facilitySearchQueryProvider).isNotEmpty;
//     final deliveryAsync = ref.watch(deliveryFacilityAnswerProvider);
//     final nearest = ref.watch(nearestFacilitiesProvider).asData?.value?.facilities ??
//         const <BpcrFacilityModel>[];
//
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: TopBar(l10n: l10n),
//       body: SafeArea(
//         top: false,
//         child: Column(
//           children: [
//             BpcrSectionHeader(iconAsset: 'assets/icons/bpcr5.png', title: l10n.bpcr_health_facility_title),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
//               child: TextField(
//                 controller: _searchCtrl,
//                 onChanged: _onSearchChanged,
//                 decoration: InputDecoration(
//                   hintText: l10n.bpcr_search_facility_hint,
//                   prefixIcon: const Icon(Icons.search),
//                   filled: true,
//                   fillColor: const Color(0xFFF2F2F2),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: facilitiesAsync.when(
//                 loading: () => const Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
//                 error: (e, _) => Center(child: Text(l10n.bpcr_facilities_load_error)),
//                 data: (data) {
//                   // Seed the "what's actually saved" snapshot once per load
//                   // of fresh server data (this runs again after a
//                   // successful save, since save() invalidates the
//                   // provider — so the snapshot always reflects reality).
//                   _initialSelectedIds ??= data.selected.map((f) => f.id).toSet();
//
//                   // final byId = <String, BpcrFacilityModel>{
//                   //   for (final f in [...data.catchment, ...data.results, ...data.selected]) f.id: f,
//                   // };
//                   final byId = <String, BpcrFacilityModel>{
//                     for (final f in [...nearest, ...data.catchment, ...data.results, ...data.selected]) f.id: f,
//                   };
//                   final selectedFacilities = selectedIds.map((id) => byId[id]).whereType<BpcrFacilityModel>().toList();
//
//                   return deliveryAsync.when(
//                     loading: () => const Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
//                     error: (e, _) => Center(child: Text(l10n.bpcr_facilities_load_error)),
//                     data: (deliveryId) {
//                       if (!_deliverySeeded) {
//                         _deliverySeeded = true;
//                         _initialDeliveryFacilityId = deliveryId;
//                       }
//                       final facilitiesDirty = !_setEquals(selectedIds, _initialSelectedIds!);
//                       final deliveryDirty = deliveryId != _initialDeliveryFacilityId;
//                       final isDirty = facilitiesDirty || deliveryDirty;
//
//                       return Column(
//                         children: [
//                           Expanded(
//                             child: SingleChildScrollView(
//                               physics: const BouncingScrollPhysics(),
//                               padding: const EdgeInsets.fromLTRB(
//                                 AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.lg,
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   if (!isSearching) ...[
//                                     const NearestFacilitiesSection(),
//                                     const SizedBox(height: AppSpacing.lg),
//                                     const Divider(),
//                                     const SizedBox(height: AppSpacing.md),
//                                     // ── Saved facilities — always visible ──
//                                     Text(l10n.bpcr_saved_facilities, style: AppTypography.titleMedium),
//                                     const SizedBox(height: AppSpacing.sm),
//                                     if (selectedFacilities.isEmpty)
//                                       Padding(
//                                         padding: const EdgeInsets.only(bottom: AppSpacing.md),
//                                         child: Text(l10n.bpcr_no_facilities_saved_yet,
//                                             style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText)),
//                                       )
//                                     else
//                                       ...selectedFacilities.map((f) => Padding(
//                                         padding: const EdgeInsets.only(bottom: AppSpacing.md),
//                                         child: FacilityCard(
//                                           facility: f.copyWith(isSelected: true),
//                                           isSelected: true,
//                                           onToggleSelect: () =>
//                                               ref.read(bpcrFacilitySelectionProvider.notifier).toggle(f.id),
//                                         ),
//                                       )),
//                                     const SizedBox(height: AppSpacing.lg),
//                                     const Divider(),
//                                     const SizedBox(height: AppSpacing.md),
//
//                                     // ── Her catchment, to add more ──
//                                     Text(l10n.bpcr_your_health_facilities, style: AppTypography.titleMedium),
//                                     const SizedBox(height: AppSpacing.sm),
//                                     if (data.catchment.isEmpty)
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
//                                         child: Text(l10n.bpcr_no_catchment_facility,
//                                             style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText)),
//                                       )
//                                     else
//                                       ...data.catchment.map((f) => Padding(
//                                         padding: const EdgeInsets.only(bottom: AppSpacing.md),
//                                         child: FacilityCard(
//                                           facility: f,
//                                           isSelected: selectedIds.contains(f.id),
//                                           onToggleSelect: () =>
//                                               ref.read(bpcrFacilitySelectionProvider.notifier).toggle(f.id),
//                                         ),
//                                       )),
//
//                                     // ── Where is she planning to deliver ──
//                                     const SizedBox(height: AppSpacing.lg),
//                                     const Divider(),
//                                     const SizedBox(height: AppSpacing.md),
//                                     Text(l10n.bpcr_delivery_place_question, style: AppTypography.titleMedium),
//                                     const SizedBox(height: AppSpacing.xs),
//                                     if (selectedFacilities.isEmpty)
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
//                                         child: Text(l10n.bpcr_select_facility_first_hint,
//                                             style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//                                       )
//                                     else
//                                       ...selectedFacilities.map((f) => _DeliveryFacilityRadioRow(
//                                         facility: f,
//                                         selected: deliveryId == f.id,
//                                         onTap: () => ref.read(deliveryFacilityAnswerProvider.notifier)
//                                             .set(deliveryId == f.id ? null : f.id),
//                                       )),
//                                   ] else ...[
//                                     Text('${data.results.length} ${l10n.bpcr_facilities_found}', style: AppTypography.bodyMedium),
//                                     const SizedBox(height: AppSpacing.md),
//                                     ...data.results.map((f) => Padding(
//                                       padding: const EdgeInsets.only(bottom: AppSpacing.md),
//                                       child: FacilityCard(
//                                         facility: f,
//                                         isSelected: selectedIds.contains(f.id),
//                                         onToggleSelect: () =>
//                                             ref.read(bpcrFacilitySelectionProvider.notifier).toggle(f.id),
//                                       ),
//                                     )),
//                                   ],
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // if (!isSearching)
//                           //   Padding(
//                           //     padding: const EdgeInsets.all(AppSpacing.md),
//                           //     child: AppPrimaryButton(
//                           //       label: l10n.save,
//                           //       onTap: !isDirty ? null : () async {
//                           //         final selOk = facilitiesDirty
//                           //             ? await ref.read(bpcrFacilitySelectionProvider.notifier).save()
//                           //             : true;
//                           //         final delOk = deliveryDirty
//                           //             ? await ref.read(deliveryFacilityAnswerProvider.notifier).save()
//                           //             : true;
//                           //         if (context.mounted) {
//                           //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           //             content: Text((selOk && delOk) ? l10n.bpcr_facilities_saved : l10n.bpcr_facilities_save_error),
//                           //           ));
//                           //           if (selOk && delOk) {
//                           //             setState(() {
//                           //               _initialSelectedIds = null; // re-seed from the refreshed data next build
//                           //               _deliverySeeded = false;
//                           //             });
//                           //           }
//                           //         }
//                           //       },
//                           //     ),
//                           //   ),
//                           if (!isSearching)
//                             Padding(
//                               padding: const EdgeInsets.all(AppSpacing.md),
//                               child: _isSaving
//                                   ? const SizedBox(
//                                 height: 48,
//                                 child: Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
//                               )
//                                   : AppPrimaryButton(
//                                 label: l10n.save,
//                                 onTap: !isDirty
//                                     ? null
//                                     : () => _save(
//                                   facilitiesDirty: facilitiesDirty,
//                                   deliveryDirty: deliveryDirty,
//                                 ),
//                               ),
//                             ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
//     );
//   }
// }
//
// bool _setEquals(Set<String> a, Set<String> b) => a.length == b.length && a.containsAll(b);
//
// class _DeliveryFacilityRadioRow extends StatelessWidget {
//   final BpcrFacilityModel facility;
//   final bool selected;
//   final VoidCallback onTap;
//   const _DeliveryFacilityRadioRow({required this.facility, required this.selected, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 6),
//         child: Row(children: [
//           Icon(selected ? Icons.radio_button_checked : Icons.radio_button_off,
//               color: selected ? AppColors.gradStart : AppColors.hintText, size: 20),
//           const SizedBox(width: 8),
//           Expanded(child: Text('${facility.facilityType} — ${facility.name}', style: AppTypography.bodyLarge)),
//         ]),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sangwari_maa/core/constants/app_colors.dart';
// import 'package:sangwari_maa/core/constants/app_spacing.dart';
// import 'package:sangwari_maa/core/constants/app_typography.dart';
// import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
// import 'package:sangwari_maa/features/bpcr/data/model/bpcr_facility_model.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_providers.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_answers_providers.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_nearest_providers.dart';
// import 'package:sangwari_maa/shared/widgets/app_bar.dart';
// import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';
// import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/widgets/facility_card.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/widgets/nearest_facilities_section.dart';
//
// class HealthFacilityIdPage extends ConsumerStatefulWidget {
//   const HealthFacilityIdPage({super.key});
//
//   @override
//   ConsumerState<HealthFacilityIdPage> createState() => _HealthFacilityIdPageState();
// }
//
// class _HealthFacilityIdPageState extends ConsumerState<HealthFacilityIdPage> {
//   final _searchCtrl = TextEditingController();
//   Timer? _debounce;
//
//   // Captured once per screen visit, so "dirty" (= Save enabled) means
//   // "different from what's on the server right now", not "any selection
//   // exists". Re-seeded whenever the underlying async data first loads.
//   Set<String>? _initialSelectedIds;
//   String? _initialDeliveryFacilityId;
//   bool _deliverySeeded = false;
//   bool _isSaving = false;
//
//   // Every facility object seen on this screen (nearest, her village's own,
//   // search results, already-saved). A ticked facility must stay displayable
//   // after the search box is cleared, when the server no longer returns it.
//   final Map<String, BpcrFacilityModel> _known = {};
//
//   void _remember(Iterable<BpcrFacilityModel> items) {
//     for (final f in items) {
//       _known[f.id] = f;
//     }
//   }
//
//   @override
//   void dispose() {
//     _debounce?.cancel();
//     _searchCtrl.dispose();
//     super.dispose();
//   }
//
//   void _onSearchChanged(String value) {
//     _debounce?.cancel();
//     _debounce = Timer(const Duration(milliseconds: 300), () {
//       ref.read(facilitySearchQueryProvider.notifier).set(value.trim());
//     });
//   }
//
//   Future<void> _save({required bool facilitiesDirty, required bool deliveryDirty}) async {
//     if (_isSaving) return;
//     setState(() => _isSaving = true);
//     try {
//       final selOk = facilitiesDirty
//           ? await ref.read(bpcrFacilitySelectionProvider.notifier).save()
//           : true;
//       final delOk = deliveryDirty
//           ? await ref.read(deliveryFacilityAnswerProvider.notifier).save()
//           : true;
//
//       if (!mounted) return;
//       final l10n = AppLocalizations.of(context)!;
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text((selOk && delOk) ? l10n.bpcr_saved : l10n.bpcr_facilities_save_error),
//       ));
//       if (selOk && delOk) {
//         setState(() {
//           _initialSelectedIds = null; // re-seed from the refreshed data next build
//           _deliverySeeded = false;
//         });
//       }
//     } finally {
//       if (mounted) setState(() => _isSaving = false);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//     final facilitiesAsync = ref.watch(bpcrFacilitiesProvider);
//     final selectedIds = ref.watch(bpcrFacilitySelectionProvider);
//     final isSearching = ref.watch(facilitySearchQueryProvider).isNotEmpty;
//     final deliveryAsync = ref.watch(deliveryFacilityAnswerProvider);
//     final nearest = ref.watch(nearestFacilitiesProvider).asData?.value?.facilities ??
//         const <BpcrFacilityModel>[];
//     _remember(nearest);
//
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: TopBar(l10n: l10n),
//       body: SafeArea(
//         top: false,
//         child: Column(
//           children: [
//             BpcrSectionHeader(iconAsset: 'assets/icons/bpcr5.png', title: l10n.bpcr_health_facility_title),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
//               child: TextField(
//                 controller: _searchCtrl,
//                 onChanged: _onSearchChanged,
//                 decoration: InputDecoration(
//                   hintText: l10n.bpcr_search_facility_hint,
//                   prefixIcon: const Icon(Icons.search),
//                   filled: true,
//                   fillColor: const Color(0xFFF2F2F2),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: facilitiesAsync.when(
//                 loading: () => const Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
//                 error: (e, _) => Center(child: Text(l10n.bpcr_facilities_load_error)),
//                 data: (data) {
//                   // Seed the "what's actually saved" snapshot once per load
//                   // of fresh server data (this runs again after a
//                   // successful save, since save() invalidates the
//                   // provider — so the snapshot always reflects reality).
//                   _initialSelectedIds ??= data.selected.map((f) => f.id).toSet();
//
//                   // Server data last, so it wins over the copies remembered earlier.
//                   _remember([...data.results, ...data.catchment, ...data.selected]);
//                   final selectedFacilities =
//                   selectedIds.map((id) => _known[id]).whereType<BpcrFacilityModel>().toList();
//
//                   return deliveryAsync.when(
//                     loading: () => const Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
//                     error: (e, _) => Center(child: Text(l10n.bpcr_facilities_load_error)),
//                     data: (deliveryId) {
//                       if (!_deliverySeeded) {
//                         _deliverySeeded = true;
//                         _initialDeliveryFacilityId = deliveryId;
//                       }
//                       final facilitiesDirty = !_setEquals(selectedIds, _initialSelectedIds!);
//                       final deliveryDirty = deliveryId != _initialDeliveryFacilityId;
//                       final isDirty = facilitiesDirty || deliveryDirty;
//                       final chosenDelivery = deliveryId == null ? null : _known[deliveryId];
//
//                       return Column(
//                         children: [
//                           Expanded(
//                             child: SingleChildScrollView(
//                               physics: const BouncingScrollPhysics(),
//                               padding: const EdgeInsets.fromLTRB(
//                                 AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.lg,
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   if (!isSearching) ...[
//                                     // ── 1. Nearest facility of each type, with the map ──
//                                     const NearestFacilitiesSection(),
//                                     const SizedBox(height: AppSpacing.lg),
//                                     const Divider(),
//                                     const SizedBox(height: AppSpacing.md),
//
//                                     // ── 2. Her village's own SHC / PHC / CHC ──
//                                     if (data.catchment.isNotEmpty) ...[
//                                       Text(l10n.bpcr_your_health_facilities, style: AppTypography.titleMedium),
//                                       const SizedBox(height: AppSpacing.sm),
//                                       ...data.catchment.map((f) => Padding(
//                                         padding: const EdgeInsets.only(bottom: AppSpacing.md),
//                                         child: FacilityCard(
//                                           facility: f,
//                                           isSelected: selectedIds.contains(f.id),
//                                           onToggleSelect: () =>
//                                               ref.read(bpcrFacilitySelectionProvider.notifier).toggle(f.id),
//                                         ),
//                                       )),
//                                       const SizedBox(height: AppSpacing.lg),
//                                       const Divider(),
//                                       const SizedBox(height: AppSpacing.md),
//                                     ],
//
//                                     // ── 3. Where is she planning to deliver ──
//                                     Text(l10n.bpcr_delivery_place_question, style: AppTypography.titleMedium),
//                                     const SizedBox(height: AppSpacing.xs),
//                                     if (selectedFacilities.isEmpty)
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
//                                         child: Text(l10n.bpcr_select_facility_first_hint,
//                                             style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//                                       )
//                                     else
//                                       ...selectedFacilities.map((f) => _DeliveryFacilityRadioRow(
//                                         facility: f,
//                                         selected: deliveryId == f.id,
//                                         removeTooltip: l10n.bpcr_remove_facility,
//                                         onTap: () => ref.read(deliveryFacilityAnswerProvider.notifier)
//                                             .set(deliveryId == f.id ? null : f.id),
//                                         onRemove: () {
//                                           ref.read(bpcrFacilitySelectionProvider.notifier).toggle(f.id);
//                                           if (deliveryId == f.id) {
//                                             ref.read(deliveryFacilityAnswerProvider.notifier).set(null);
//                                           }
//                                         },
//                                       )),
//
//                                     // ── 4. Her choice, at the end ──
//                                     if (chosenDelivery != null) ...[
//                                       const SizedBox(height: AppSpacing.md),
//                                       _DeliverySummaryCard(
//                                         title: l10n.bpcr_your_delivery_place,
//                                         facility: chosenDelivery,
//                                       ),
//                                     ],
//                                   ] else ...[
//                                     Text('${data.results.length} ${l10n.bpcr_facilities_found}', style: AppTypography.bodyMedium),
//                                     const SizedBox(height: AppSpacing.md),
//                                     ...data.results.map((f) => Padding(
//                                       padding: const EdgeInsets.only(bottom: AppSpacing.md),
//                                       child: FacilityCard(
//                                         facility: f,
//                                         isSelected: selectedIds.contains(f.id),
//                                         onToggleSelect: () =>
//                                             ref.read(bpcrFacilitySelectionProvider.notifier).toggle(f.id),
//                                       ),
//                                     )),
//                                   ],
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // Always visible, also while searching: ticking a search result
//                           // changes the selection, so she can save without clearing the search.
//                           Padding(
//                             padding: const EdgeInsets.all(AppSpacing.md),
//                             child: _isSaving
//                                 ? const SizedBox(
//                               height: 48,
//                               child: Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
//                             )
//                                 : AppPrimaryButton(
//                               label: l10n.save,
//                               onTap: !isDirty
//                                   ? null
//                                   : () => _save(
//                                 facilitiesDirty: facilitiesDirty,
//                                 deliveryDirty: deliveryDirty,
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
//     );
//   }
// }
//
// bool _setEquals(Set<String> a, Set<String> b) => a.length == b.length && a.containsAll(b);
//
// class _DeliveryFacilityRadioRow extends StatelessWidget {
//   final BpcrFacilityModel facility;
//   final bool selected;
//   final String removeTooltip;
//   final VoidCallback onTap;
//   final VoidCallback onRemove;
//   const _DeliveryFacilityRadioRow({
//     required this.facility,
//     required this.selected,
//     required this.removeTooltip,
//     required this.onTap,
//     required this.onRemove,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 2),
//         child: Row(children: [
//           Icon(selected ? Icons.radio_button_checked : Icons.radio_button_off,
//               color: selected ? AppColors.gradStart : AppColors.hintText, size: 20),
//           const SizedBox(width: 8),
//           Expanded(child: Text('${facility.facilityType} — ${facility.name}', style: AppTypography.bodyLarge)),
//           IconButton(
//             onPressed: onRemove,
//             tooltip: removeTooltip,
//             visualDensity: VisualDensity.compact,
//             icon: const Icon(Icons.close, size: 20, color: AppColors.hintText),
//           ),
//         ]),
//       ),
//     );
//   }
// }
//
// class _DeliverySummaryCard extends StatelessWidget {
//   final String title;
//   final BpcrFacilityModel facility;
//   const _DeliverySummaryCard({required this.title, required this.facility});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(AppSpacing.md),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF8F8F8),
//         borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
//         border: const Border(left: BorderSide(color: AppColors.riskGreen, width: 5)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//           const SizedBox(height: 2),
//           Text('${facility.facilityType} — ${facility.name}', style: AppTypography.titleMedium),
//           if (facility.subDistrict != null)
//             Text(facility.subDistrict!, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//         ],
//       ),
//     );
//   }
// }
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
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_nearest_providers.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/facility_card.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/nearest_facilities_section.dart';

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
  bool _isSaving = false;

  // Every facility object seen on this screen (nearest, her village's own,
  // search results, already-saved). A ticked facility must stay displayable
  // after the search box is cleared, when the server no longer returns it.
  final Map<String, BpcrFacilityModel> _known = {};

  void _remember(Iterable<BpcrFacilityModel> items) {
    for (final f in items) {
      _known[f.id] = f;
    }
  }

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

  /// Back while a search is showing: clear it and return to the normal screen,
  /// instead of leaving the page.
  void _clearSearch() {
    _debounce?.cancel();
    _searchCtrl.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    ref.read(facilitySearchQueryProvider.notifier).set('');
  }

  Future<void> _save({required bool facilitiesDirty, required bool deliveryDirty}) async {
    if (_isSaving) return;
    setState(() => _isSaving = true);
    try {
      final selOk = facilitiesDirty
          ? await ref.read(bpcrFacilitySelectionProvider.notifier).save()
          : true;
      final delOk = deliveryDirty
          ? await ref.read(deliveryFacilityAnswerProvider.notifier).save()
          : true;

      if (!mounted) return;
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text((selOk && delOk) ? l10n.bpcr_saved : l10n.bpcr_facilities_save_error),
      ));
      if (selOk && delOk) {
        setState(() {
          _initialSelectedIds = null; // re-seed from the refreshed data next build
          _deliverySeeded = false;
        });
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final facilitiesAsync = ref.watch(bpcrFacilitiesProvider);
    final selectedIds = ref.watch(bpcrFacilitySelectionProvider);
    final isSearching = ref.watch(facilitySearchQueryProvider).isNotEmpty;
    final deliveryAsync = ref.watch(deliveryFacilityAnswerProvider);
    final nearest = ref.watch(nearestFacilitiesProvider).asData?.value?.facilities ??
        const <BpcrFacilityModel>[];
    _remember(nearest);

    return PopScope(
      // While a search is showing, back clears it; otherwise back leaves the page as before.
      canPop: !isSearching,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _clearSearch();
      },
      child: Scaffold(
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
                  loading: () => const Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
                  error: (e, _) => Center(child: Text(l10n.bpcr_facilities_load_error)),
                  data: (data) {
                    // Seed the "what's actually saved" snapshot once per load
                    // of fresh server data (this runs again after a
                    // successful save, since save() invalidates the
                    // provider — so the snapshot always reflects reality).
                    _initialSelectedIds ??= data.selected.map((f) => f.id).toSet();

                    // Server data last, so it wins over the copies remembered earlier.
                    _remember([...data.results, ...data.catchment, ...data.selected]);
                    final selectedFacilities =
                    selectedIds.map((id) => _known[id]).whereType<BpcrFacilityModel>().toList();

                    return deliveryAsync.when(
                      loading: () => const Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
                      error: (e, _) => Center(child: Text(l10n.bpcr_facilities_load_error)),
                      data: (deliveryId) {
                        if (!_deliverySeeded) {
                          _deliverySeeded = true;
                          _initialDeliveryFacilityId = deliveryId;
                        }
                        final facilitiesDirty = !_setEquals(selectedIds, _initialSelectedIds!);
                        final deliveryDirty = deliveryId != _initialDeliveryFacilityId;
                        final isDirty = facilitiesDirty || deliveryDirty;
                        final chosenDelivery = deliveryId == null ? null : _known[deliveryId];

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
                                      // ── 1. Nearest facility of each type, with the map ──
                                      const NearestFacilitiesSection(),
                                      const SizedBox(height: AppSpacing.lg),
                                      const Divider(),
                                      const SizedBox(height: AppSpacing.md),

                                      // ── 2. Her village's own SHC / PHC / CHC ──
                                      if (data.catchment.isNotEmpty) ...[
                                        Text(l10n.bpcr_your_health_facilities, style: AppTypography.titleMedium),
                                        const SizedBox(height: AppSpacing.sm),
                                        ...data.catchment.map((f) => Padding(
                                          padding: const EdgeInsets.only(bottom: AppSpacing.md),
                                          child: FacilityCard(
                                            facility: f,
                                            isSelected: selectedIds.contains(f.id),
                                            onToggleSelect: () =>
                                                ref.read(bpcrFacilitySelectionProvider.notifier).toggle(f.id),
                                          ),
                                        )),
                                        const SizedBox(height: AppSpacing.lg),
                                        const Divider(),
                                        const SizedBox(height: AppSpacing.md),
                                      ],

                                      // ── 3. Where is she planning to deliver ──
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
                                          removeTooltip: l10n.bpcr_remove_facility,
                                          onTap: () => ref.read(deliveryFacilityAnswerProvider.notifier)
                                              .set(deliveryId == f.id ? null : f.id),
                                          onRemove: () {
                                            ref.read(bpcrFacilitySelectionProvider.notifier).toggle(f.id);
                                            if (deliveryId == f.id) {
                                              ref.read(deliveryFacilityAnswerProvider.notifier).set(null);
                                            }
                                          },
                                        )),

                                      // ── 4. Her choice, at the end ──
                                      if (chosenDelivery != null) ...[
                                        const SizedBox(height: AppSpacing.md),
                                        _DeliverySummaryCard(
                                          title: l10n.bpcr_your_delivery_place,
                                          facility: chosenDelivery,
                                        ),
                                      ],
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
                            // Always visible, also while searching: ticking a search result
                            // changes the selection, so she can save without clearing the search.
                            Padding(
                              padding: const EdgeInsets.all(AppSpacing.md),
                              child: _isSaving
                                  ? const SizedBox(
                                height: 48,
                                child: Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
                              )
                                  : AppPrimaryButton(
                                label: l10n.save,
                                onTap: !isDirty
                                    ? null
                                    : () => _save(
                                  facilitiesDirty: facilitiesDirty,
                                  deliveryDirty: deliveryDirty,
                                ),
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
      ),
    );
  }
}

bool _setEquals(Set<String> a, Set<String> b) => a.length == b.length && a.containsAll(b);

class _DeliveryFacilityRadioRow extends StatelessWidget {
  final BpcrFacilityModel facility;
  final bool selected;
  final String removeTooltip;
  final VoidCallback onTap;
  final VoidCallback onRemove;
  const _DeliveryFacilityRadioRow({
    required this.facility,
    required this.selected,
    required this.removeTooltip,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(children: [
          Icon(selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? AppColors.gradStart : AppColors.hintText, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text('${facility.facilityType} — ${facility.name}', style: AppTypography.bodyLarge)),
          IconButton(
            onPressed: onRemove,
            tooltip: removeTooltip,
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.close, size: 20, color: AppColors.hintText),
          ),
        ]),
      ),
    );
  }
}

class _DeliverySummaryCard extends StatelessWidget {
  final String title;
  final BpcrFacilityModel facility;
  const _DeliverySummaryCard({required this.title, required this.facility});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: const Border(left: BorderSide(color: AppColors.riskGreen, width: 5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
          const SizedBox(height: 2),
          Text('${facility.facilityType} — ${facility.name}', style: AppTypography.titleMedium),
          if (facility.subDistrict != null)
            Text(facility.subDistrict!, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
        ],
      ),
    );
  }
}