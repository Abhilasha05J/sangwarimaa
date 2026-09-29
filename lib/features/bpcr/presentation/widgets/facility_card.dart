import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/features/bpcr/data/model/bpcr_facility_model.dart';

class FacilityCard extends StatelessWidget {
  final BpcrFacilityModel facility;
  final bool isSelected;
  final VoidCallback onToggleSelect;

  const FacilityCard({
    super.key,
    required this.facility,
    required this.isSelected,
    required this.onToggleSelect,
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
