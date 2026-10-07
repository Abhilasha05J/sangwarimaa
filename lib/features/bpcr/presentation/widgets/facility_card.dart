// import 'package:flutter/material.dart';
// import 'package:sangwari_maa/core/constants/app_colors.dart';
// import 'package:sangwari_maa/core/constants/app_spacing.dart';
// import 'package:sangwari_maa/core/constants/app_typography.dart';
// import 'package:sangwari_maa/features/bpcr/data/model/bpcr_facility_model.dart';
//
// class FacilityCard extends StatelessWidget {
//   final BpcrFacilityModel facility;
//   final bool isSelected;
//   final VoidCallback onToggleSelect;
//   final int? rank;              // 1..4 badge matching the map pin (nearest list only)
//   final String? distanceLabel;  // e.g. "2.4 km away"
//
//   const FacilityCard({
//     super.key,
//     required this.facility,
//     required this.isSelected,
//     required this.onToggleSelect,
//     this.rank,
//     this.distanceLabel,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onToggleSelect,
//       borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
//       child: Container(
//         decoration: BoxDecoration(
//           color: const Color(0xFFF8F8F8),
//           borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
//           border: Border(
//             left: BorderSide(color: isSelected ? AppColors.riskGreen : AppColors.gradStart, width: 5),
//           ),
//         ),
//         padding: const EdgeInsets.all(AppSpacing.md),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(children: [
//                     if (rank != null) ...[
//                       Container(
//                         width: 22,
//                         height: 22,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           color: isSelected ? AppColors.riskGreen : AppColors.gradStart,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Text('$rank',
//                             style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
//                       ),
//                       const SizedBox(width: 8),
//                     ],
//                     Text(facility.facilityType, style: AppTypography.titleMedium.copyWith(color: AppColors.riskGreen)),
//                     if (facility.isFru) ...[
//                       const SizedBox(width: 6),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                         decoration: BoxDecoration(color: const Color(0xFFFCE4E4), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
//                         child: const Text('FRU', style: TextStyle(fontSize: 11, color: AppColors.riskRed)),
//                       ),
//                     ],
//                     if (facility.is24x7) ...[
//                       const SizedBox(width: 6),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                         decoration: BoxDecoration(color: const Color(0xFFE3F5EA), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
//                         child: const Text('24x7', style: TextStyle(fontSize: 11, color: AppColors.riskGreen)),
//                       ),
//                     ],
//                   ]),
//                   const SizedBox(height: AppSpacing.xs),
//                   Text(facility.name, style: AppTypography.bodyLarge),
//                   if (facility.subDistrict != null) ...[
//                     const SizedBox(height: 2),
//                     Text(facility.subDistrict!, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//                   ],
//                   if (distanceLabel != null) ...[
//                     const SizedBox(height: 2),
//                     Text(distanceLabel!, style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.w600)),
//                   ],
//                 ],
//               ),
//             ),
//             Icon(
//               isSelected ? Icons.check_circle_rounded : Icons.radio_button_unchecked,
//               color: isSelected ? AppColors.riskGreen : AppColors.hintText,
//               size: 26,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/features/bpcr/data/model/bpcr_facility_model.dart';

class FacilityCard extends StatelessWidget {
  final BpcrFacilityModel facility;
  final bool isSelected;
  final VoidCallback onToggleSelect;
  final int? rank;              // 1..4 badge matching the map pin (nearest list only)
  final String? distanceLabel;  // e.g. "2.4 km away"
  final VoidCallback? onShowRoute;  // null = no route button
  final String? routeLabel;         // "Show route" / "Hide route"
  final bool routeLoading;
  final String? routeSummary;       // "By road: 3.2 km · 7 min" or an unavailable message

  const FacilityCard({
    super.key,
    required this.facility,
    required this.isSelected,
    required this.onToggleSelect,
    this.rank,
    this.distanceLabel,
    this.onShowRoute,
    this.routeLabel,
    this.routeLoading = false,
    this.routeSummary,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggleSelect,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border(
            left: BorderSide(color: isSelected ? AppColors.riskGreen : AppColors.gradStart, width: 5),
          ),
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    if (rank != null) ...[
                      Container(
                        width: 22,
                        height: 22,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.riskGreen : AppColors.gradStart,
                          shape: BoxShape.circle,
                        ),
                        child: Text('$rank',
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(facility.facilityType, style: AppTypography.titleMedium.copyWith(color: AppColors.riskGreen)),
                    if (facility.isFru) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: const Color(0xFFFCE4E4), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
                        child: const Text('FRU', style: TextStyle(fontSize: 11, color: AppColors.riskRed)),
                      ),
                    ],
                    if (facility.is24x7) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: const Color(0xFFE3F5EA), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
                        child: const Text('24x7', style: TextStyle(fontSize: 11, color: AppColors.riskGreen)),
                      ),
                    ],
                  ]),
                  const SizedBox(height: AppSpacing.xs),
                  Text(facility.name, style: AppTypography.bodyLarge),
                  if (facility.subDistrict != null) ...[
                    const SizedBox(height: 2),
                    Text(facility.subDistrict!, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                  ],
                  if (distanceLabel != null) ...[
                    const SizedBox(height: 2),
                    Text(distanceLabel!, style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.w600)),
                  ],
                  if (onShowRoute != null) ...[
                    const SizedBox(height: 2),
                    Row(children: [
                      TextButton.icon(
                        onPressed: onShowRoute,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 32),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          foregroundColor: AppColors.pinkText,
                        ),
                        icon: const Icon(Icons.alt_route, size: 18),
                        label: Text(routeLabel ?? ''),
                      ),
                      if (routeLoading)
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: SizedBox(
                            width: 14,
                            height: 14,
                            child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.pinkText),
                          ),
                        ),
                    ]),
                    if (routeSummary != null)
                      Text(routeSummary!, style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle_rounded : Icons.radio_button_unchecked,
              color: isSelected ? AppColors.riskGreen : AppColors.hintText,
              size: 26,
            ),
          ],
        ),
      ),
    );
  }
}