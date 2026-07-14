import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTypography {
  // Single base style — const so Flutter can cache it and reuse across frames
  // without allocating a new TextStyle object on every build().
  static const TextStyle _base = TextStyle(
    fontFamily: 'Roboto',          // ← must match pubspec.yaml family name exactly
    fontFamilyFallback: ['Roboto'],
    //letterSpacing: 0.3,
   // height: 1.4,
    leadingDistribution: TextLeadingDistribution.even,
    color: AppColors.bodyText,
  );

  static final TextStyle headlineLarge  = _base.copyWith(fontSize: 24, fontWeight: FontWeight.w700);
  static final TextStyle headlineMedium = _base.copyWith(fontSize: 20, fontWeight: FontWeight.w700);
  static final TextStyle titleLarge     = _base.copyWith(fontSize: 18, fontWeight: FontWeight.w600);
  static final TextStyle titleMedium    = _base.copyWith(fontSize: 16, fontWeight: FontWeight.w600);
  static final TextStyle titleSmall    = _base.copyWith(fontSize: 14, fontWeight: FontWeight.w500);
  static final TextStyle bodyLarge      = _base.copyWith(fontSize: 15, fontWeight: FontWeight.w400);
  static final TextStyle bodyMedium     = _base.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
  static final TextStyle bodySmall      = _base.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.hintText);
  static final TextStyle labelLarge     = _base.copyWith(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.white);
  static final TextStyle labelMedium    = _base.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.white);
  static final TextStyle hint           = _base.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.hintText);
  static final TextStyle pinkLabel      = _base.copyWith(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.pinkText);
  static final TextStyle pinkLabelLg    = _base.copyWith(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.pinkText);
  static final TextStyle brandSangwari  = _base.copyWith(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.sangwari);
  static final TextStyle brandMaa       = _base.copyWith(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.maa);
  static final TextStyle fieldLabel     = _base.copyWith(fontSize: 13, fontWeight: FontWeight.w500);
  static final TextStyle linkText       = _base.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.gradStart);
  static final TextStyle captionGrey    = _base.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.hintText);
}