// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sangwari_maa/core/constants/app_colors.dart';
// import 'package:sangwari_maa/core/constants/app_spacing.dart';
// import 'package:sangwari_maa/core/constants/app_typography.dart';
// import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
// import 'package:sangwari_maa/shared/widgets/app_bar.dart';
// import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
// import 'package:sangwari_maa/features/bpcr/data/model/bpcr_blood_donor_model.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_blood_donor_providers.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/widgets/add_donor_sheet.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_info_banner.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';
//
// class CommunityBloodDonorPage extends ConsumerWidget {
//   const CommunityBloodDonorPage({super.key});
//
//   Future<void> _addDonor(BuildContext context, WidgetRef ref, {required bool isCommunity}) async {
//     final l10n = AppLocalizations.of(context)!;
//     final result = await showAddDonorSheet(context, isCommunity: isCommunity);
//     if (result == null) return;
//     final ok = await ref.read(bpcrBloodDonorsProvider.notifier).add(
//       donorType: isCommunity ? 'community' : 'family',
//       name: result.name, bloodGroup: result.bloodGroup, phone: result.phone,
//       relation: result.relation, address: result.address,
//     );
//     if (context.mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(ok ? l10n.bpcr_donor_added : l10n.bpcr_donor_add_error),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = AppLocalizations.of(context)!;
//     final donorsAsync = ref.watch(bpcrBloodDonorsProvider);
//
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: TopBar(l10n: l10n),
//       body: SafeArea(
//         top: false,
//         child: Column(
//           children: [
//             BpcrSectionHeader(iconAsset: 'assets/icons/bpcr10.png', title: l10n.bpcr_blood_donor_title),
//             Expanded(
//               child: donorsAsync.when(
//                 loading: () => const Center(child: CircularProgressIndicator()),
//                 error: (e, _) => Center(child: Text(l10n.bpcr_answers_load_error)),
//                 data: (data) => SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BpcrInfoBanner(text: l10n.bpcr_blood_donor_reminder_quote),
//                       const SizedBox(height: AppSpacing.lg),
//                       _StatCard(
//                         label: l10n.bpcr_self_blood_group_label,
//                         value: data.selfBloodGroup ?? l10n.bpcr_not_set,
//                       ),
//                       const SizedBox(height: AppSpacing.lg),
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(l10n.bpcr_family_donors_label, style: AppTypography.titleMedium.copyWith(color: AppColors.pinkText)),
//                           TextButton(
//                             onPressed: () => _addDonor(context, ref, isCommunity: false),
//                             style: TextButton.styleFrom(foregroundColor: AppColors.riskGreen),
//                             child: Text(l10n.bpcr_add_family_member, style: const TextStyle(color: AppColors.riskGreen, fontWeight: FontWeight.w600)),
//                           ),
//                         ],
//                       ),
//                       if (data.family.isEmpty)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
//                           child: Text(l10n.bpcr_no_donors_added, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//                         )
//                       else
//                         ...data.family.map((d) => _DonorRow(
//                           donor: d,
//                           onDelete: () => ref.read(bpcrBloodDonorsProvider.notifier).remove(d.id),
//                         )),
//
//                       const SizedBox(height: AppSpacing.lg),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(l10n.bpcr_community_donors_label, style: AppTypography.titleMedium.copyWith(color: AppColors.pinkText)),
//                           TextButton(
//                             onPressed: () => _addDonor(context, ref, isCommunity: true),
//                             style: TextButton.styleFrom(foregroundColor: AppColors.riskGreen),
//                             child: Text(l10n.bpcr_add_community_donors, style: const TextStyle(color: AppColors.riskGreen, fontWeight: FontWeight.w600)),
//                           ),
//                         ],
//                       ),
//                       if (data.community.isEmpty)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
//                           child: Text(l10n.bpcr_no_donors_added, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//                         )
//                       else
//                         ...data.community.map((d) => _CommunityDonorRow(
//                           donor: d,
//                           onDelete: () => ref.read(bpcrBloodDonorsProvider.notifier).remove(d.id),
//                         )),
//                       const SizedBox(height: AppSpacing.lg),
//                     ],
//                   ),
//                 ),
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
// class _StatCard extends StatelessWidget {
//   final String label;
//   final String value;
//   const _StatCard({required this.label, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(AppSpacing.md),
//       decoration: BoxDecoration(color: const Color(0xFFFCEDEC), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label, style: AppTypography.titleMedium),
//           const SizedBox(height: 6),
//           Text(value, style: AppTypography.headlineMedium.copyWith(color: AppColors.riskRed, fontSize: 18)),
//         ],
//       ),
//     );
//   }
// }
//
// class _DonorRow extends StatelessWidget {
//   final BloodDonorModel donor;
//   final VoidCallback onDelete;
//   const _DonorRow({required this.donor, required this.onDelete});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(donor.name, style: AppTypography.titleMedium),
//                 Text('${donor.relation ?? ''} • ${donor.bloodGroup}', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//               ],
//             ),
//           ),
//           IconButton(icon: const Icon(Icons.close, size: 18, color: AppColors.hintText), onPressed: onDelete),
//         ],
//       ),
//     );
//   }
// }
//
// class _CommunityDonorRow extends StatelessWidget {
//   final BloodDonorModel donor;
//   final VoidCallback onDelete;
//   const _CommunityDonorRow({required this.donor, required this.onDelete});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: AppSpacing.sm),
//       padding: const EdgeInsets.all(AppSpacing.sm),
//       decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(donor.bloodGroup, style: AppTypography.titleMedium.copyWith(color: AppColors.riskRed)),
//           const SizedBox(height: 4),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(donor.name, style: AppTypography.bodyMedium),
//                     if (donor.address != null && donor.address!.isNotEmpty)
//                       Text(donor.address!, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//                     Text(donor.phone, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: AppSpacing.sm),
//               IconButton(icon: const Icon(Icons.close, size: 18, color: AppColors.hintText), onPressed: onDelete),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
import 'package:sangwari_maa/features/bpcr/data/model/bpcr_blood_donor_model.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_blood_donor_providers.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/add_donor_sheet.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_info_banner.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_section_header.dart';

class CommunityBloodDonorPage extends ConsumerStatefulWidget {
  const CommunityBloodDonorPage({super.key});

  @override
  ConsumerState<CommunityBloodDonorPage> createState() => _CommunityBloodDonorPageState();
}

class _CommunityBloodDonorPageState extends ConsumerState<CommunityBloodDonorPage> {
  bool _isAdding = false;
  final Set<String> _deletingIds = {};

  void _showSavedBanner(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isError ? AppColors.riskRed : AppColors.riskGreen,
        content: Row(children: [
          Icon(isError ? Icons.error_outline : Icons.check_circle_outline, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(message, style: const TextStyle(color: Colors.white))),
        ]),
        duration: const Duration(seconds: 2),
      ));
  }

  Future<void> _addDonor({required bool isCommunity}) async {
    final l10n = AppLocalizations.of(context)!;
    final result = await showAddDonorSheet(context, isCommunity: isCommunity);
    if (result == null) return;

    setState(() => _isAdding = true);
    final ok = await ref.read(bpcrBloodDonorsProvider.notifier).add(
      donorType: isCommunity ? 'community' : 'family',
      name: result.name, bloodGroup: result.bloodGroup, phone: result.phone,
      relation: result.relation, address: result.address,
    );
    if (!mounted) return;
    setState(() => _isAdding = false);
    _showSavedBanner(ok ? l10n.bpcr_donor_added : l10n.bpcr_donor_add_error, isError: !ok);
  }

  Future<void> _deleteDonor(String id) async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _deletingIds.add(id));
    final ok = await ref.read(bpcrBloodDonorsProvider.notifier).remove(id);
    if (!mounted) return;
    setState(() => _deletingIds.remove(id));
    _showSavedBanner(ok ? l10n.bpcr_donor_removed : l10n.bpcr_donor_remove_error, isError: !ok);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final donorsAsync = ref.watch(bpcrBloodDonorsProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            BpcrSectionHeader(iconAsset: 'assets/icons/bpcr10.png', title: l10n.bpcr_blood_donor_title),
            Expanded(
              child: Stack(
                children: [
                  donorsAsync.when(
                    loading: () => const Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
                    error: (e, _) => Center(child: Text(l10n.bpcr_answers_load_error)),
                    data: (data) => SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BpcrInfoBanner(text: l10n.bpcr_blood_donor_reminder_quote),
                          const SizedBox(height: AppSpacing.lg),
                          _StatCard(
                            label: l10n.bpcr_self_blood_group_label,
                            value: data.selfBloodGroup ?? l10n.bpcr_not_set,
                          ),
                          const SizedBox(height: AppSpacing.lg),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(l10n.bpcr_family_donors_label, style: AppTypography.titleMedium.copyWith(color: AppColors.pinkText)),
                              TextButton(
                                onPressed: _isAdding ? null : () => _addDonor(isCommunity: false),
                                style: TextButton.styleFrom(foregroundColor: AppColors.riskGreen),
                                child: Text(l10n.bpcr_add_family_member, style: const TextStyle(color: AppColors.riskGreen, fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                          if (data.family.isEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                              child: Text(l10n.bpcr_no_donors_added, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                            )
                          else
                            ...data.family.map((d) => _DonorRow(
                              donor: d,
                              isDeleting: _deletingIds.contains(d.id),
                              onDelete: () => _deleteDonor(d.id),
                            )),

                          const SizedBox(height: AppSpacing.lg),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(l10n.bpcr_community_donors_label, style: AppTypography.titleMedium.copyWith(color: AppColors.pinkText)),
                              TextButton(
                                onPressed: _isAdding ? null : () => _addDonor(isCommunity: true),
                                style: TextButton.styleFrom(foregroundColor: AppColors.riskGreen),
                                child: Text(l10n.bpcr_add_community_donors, style: const TextStyle(color: AppColors.riskGreen, fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                          if (data.community.isEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                              child: Text(l10n.bpcr_no_donors_added, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                            )
                          else
                            ...data.community.map((d) => _CommunityDonorRow(
                              donor: d,
                              isDeleting: _deletingIds.contains(d.id),
                              onDelete: () => _deleteDonor(d.id),
                            )),
                          const SizedBox(height: AppSpacing.lg),
                        ],
                      ),
                    ),
                  ),
                  // Blocking overlay only while an ADD is in flight (the
                  // sheet has already closed by this point) — delete uses
                  // its own per-row spinner instead, since blocking the
                  // whole screen for a single-row delete would be jarring.
                  if (_isAdding)
                    Container(
                      color: Colors.black.withOpacity(0.05),
                      child: const Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: const Color(0xFFFCEDEC), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.titleMedium),
          const SizedBox(height: 6),
          Text(value, style: AppTypography.headlineMedium.copyWith(color: AppColors.riskRed, fontSize: 18)),
        ],
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  final bool isDeleting;
  final VoidCallback onDelete;
  const _DeleteButton({required this.isDeleting, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    if (isDeleting) {
      return const SizedBox(
        width: 36, height: 36,
        child: Padding(padding: EdgeInsets.all(8), child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }
    return IconButton(icon: const Icon(Icons.close, size: 18, color: AppColors.hintText), onPressed: onDelete);
  }
}

class _DonorRow extends StatelessWidget {
  final BloodDonorModel donor;
  final bool isDeleting;
  final VoidCallback onDelete;
  const _DonorRow({required this.donor, required this.isDeleting, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDeleting ? 0.5 : 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(donor.name, style: AppTypography.titleMedium),
                  Text('${donor.relation ?? ''} • ${donor.bloodGroup}', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                ],
              ),
            ),
            _DeleteButton(isDeleting: isDeleting, onDelete: onDelete),
          ],
        ),
      ),
    );
  }
}

class _CommunityDonorRow extends StatelessWidget {
  final BloodDonorModel donor;
  final bool isDeleting;
  final VoidCallback onDelete;
  const _CommunityDonorRow({required this.donor, required this.isDeleting, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDeleting ? 0.5 : 1,
      child: Container(
        margin: const EdgeInsets.only(top: AppSpacing.sm),
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(donor.bloodGroup, style: AppTypography.titleMedium.copyWith(color: AppColors.riskRed)),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(donor.name, style: AppTypography.bodyMedium),
                      if (donor.address != null && donor.address!.isNotEmpty)
                        Text(donor.address!, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                      Text(donor.phone, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
              _DeleteButton(isDeleting: isDeleting, onDelete: onDelete),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
