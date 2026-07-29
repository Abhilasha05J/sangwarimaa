import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/features/bpcr/data/model/danger_sign_card_data.dart';

/// All BPCR danger-sign card assets reserve this ratio of box space so
/// cards stay visually consistent in a grid — but since source PNGs
/// differ slightly in native aspect ratio, we use BoxFit.contain (never
/// cover) so nothing gets cropped top/bottom or left/right. Any leftover
/// space is letterboxed with a white background that matches the card's
/// own baked-in white footer, so it reads as intentional, not as a bug.
const double _kDangerSignCardAspectRatio = 0.65; // width / height

class DangerSignCard extends StatelessWidget {
  final DangerSignCardData data;
  final bool isSelected;
  final VoidCallback onTap;

  const DangerSignCard({
    super.key,
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // NOTE: the asset itself already has a rounded border + white footer
    // strip baked in for the icon circle — do NOT wrap it in another
    // bordered/shadowed container, or you get a double-border look.
    return Semantics(
      button: true,
      selected: isSelected,
      label: data.title,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            border: Border.all(
              color: isSelected
                  ? data.accentColor
                  : Colors.transparent,
              width: 3,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(AppSpacing.radiusLg),
                    child: AspectRatio(
                      aspectRatio: _kDangerSignCardAspectRatio,
                      child: ColoredBox(
                        color: AppColors.white,
                        child: Image.asset(
                          data.imageAsset,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: data.accentColor,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                data.title,
                style: AppTypography.titleMedium.copyWith(
                  color: data.accentColor,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                data.description,
                style: AppTypography.titleMedium.copyWith(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



