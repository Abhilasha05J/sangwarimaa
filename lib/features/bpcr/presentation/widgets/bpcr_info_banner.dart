import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';

class BpcrInfoBanner extends StatelessWidget {
  final String text;
  const BpcrInfoBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFFE7E4FB),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTypography.bodyLarge.copyWith(height: 1.5),
      ),
    );
  }
}