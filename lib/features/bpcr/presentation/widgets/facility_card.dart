import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/features/bpcr/data/model/facility_data.dart';

class FacilityCard extends StatelessWidget {
  final FacilityData facility;
  final VoidCallback onNavigate;
  final VoidCallback onServices;

  const FacilityCard({
    super.key,
    required this.facility,
    required this.onNavigate,
    required this.onServices,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border(left: BorderSide(color: AppColors.gradStart, width: 5)),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Text(facility.type, style: AppTypography.titleMedium.copyWith(color: AppColors.riskGreen)),
                const SizedBox(width: 6),
                Text('(${facility.distanceKm} Km)', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
              ]),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFFFCE4E4), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
                child: Text('${facility.etaMinutes} Mins', style: AppTypography.bodySmall.copyWith(color: AppColors.riskRed)),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(facility.name, style: AppTypography.bodyLarge),
          const SizedBox(height: 4),
          Text(facility.schemeTags.join(', '), style: AppTypography.bodySmall.copyWith(color: AppColors.riskRed)),
          const SizedBox(height: AppSpacing.sm),
          Row(children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onNavigate,
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.riskGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),),
                child: const Text('Navigate'),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: OutlinedButton(
                onPressed: onServices,
                style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.pinkText),shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),),
                child: Text('Services', style: TextStyle(color: AppColors.pinkText)),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}