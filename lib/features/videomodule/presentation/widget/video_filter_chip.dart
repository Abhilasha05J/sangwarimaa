import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';

class VideoFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const VideoFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.gradStart : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? AppColors.gradStart : AppColors.fieldFill,
          ),
        ),
        child: Text(
          label,
          style: AppTypography.bodyMedium.copyWith(
            color: selected ? AppColors.white : AppColors.bodyText,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}