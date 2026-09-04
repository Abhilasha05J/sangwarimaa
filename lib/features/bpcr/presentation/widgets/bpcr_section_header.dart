import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';

/// Same header used across all 10 BPCR component pages. Renders the exact
/// same bpcrN.png asset used for that component's tile on the BpcrScreen
/// landing page, so the icon stays visually consistent between the tile
/// tap and the detail screen it opens.
class BpcrSectionHeader extends StatelessWidget {
  final String iconAsset;
  final String title;
  final Color? iconBg;

  const BpcrSectionHeader({
    super.key,
    required this.iconAsset,
    required this.title,
    this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
             child: Image.asset(iconAsset, fit: BoxFit.contain),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(title, style: AppTypography.titleLarge)),
        ],
      ),
    );
  }
}