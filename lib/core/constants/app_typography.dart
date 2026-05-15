import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract final class AppTypography {
  static TextStyle get _base => GoogleFonts.roboto();

  static TextStyle get headlineLarge  => _base.copyWith(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.bodyText);
  static TextStyle get headlineMedium => _base.copyWith(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.bodyText);
  static TextStyle get titleLarge     => _base.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.bodyText);
  static TextStyle get titleMedium    => _base.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.bodyText);
  static TextStyle get bodyLarge      => _base.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.bodyText);
  static TextStyle get bodyMedium     => _base.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.bodyText);
  static TextStyle get bodySmall      => _base.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.hintText);
  static TextStyle get labelLarge     => _base.copyWith(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.white);
  static TextStyle get labelMedium    => _base.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.white);
  static TextStyle get hint           => _base.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.hintText);
  static TextStyle get pinkLabel      => _base.copyWith(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.pinkText);
  static TextStyle get pinkLabelLg    => _base.copyWith(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.pinkText);
  static TextStyle get brandSangwari  => _base.copyWith(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.sangwari);
  static TextStyle get brandMaa       => _base.copyWith(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.maa);
  static TextStyle get fieldLabel     => _base.copyWith(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.bodyText);
  static TextStyle get linkText       => _base.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.gradStart);
  static TextStyle get captionGrey    => _base.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.hintText);
}
