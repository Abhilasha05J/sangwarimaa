import 'package:flutter/material.dart';

abstract final class AppColors {
  // ── Brand ──────────────────────────────────────────────────────────────
  static const Color sangwari   = Color(0xFFCD3600);
  static const Color maa        = Color(0xFF254017);

  // ── Primary gradient (button: left → right) ────────────────────────────
  static const Color gradStart  = Color(0xFFF58C8A);
  static const Color gradEnd    = Color(0xFFFFCCC9);

  // ── App background gradient (top → bottom) ─────────────────────────────
  static const Color bgTop      = Color(0xFFFFD1CF);
  static const Color bgBottom   = Color(0xFFFFFFFF);

  // ── Surface / Fields ───────────────────────────────────────────────────
  static const Color fieldFill  = Color(0xFFEAEAEA);
  static const Color hintText   = Color(0xFF747474);
  static const Color bodyText   = Color(0xFF000000);
  static const Color pinkText   = Color(0xFFF58D8B);
  static const Color lightBlue  = Color(0xFFE9F5FF);

  // ── Utility ────────────────────────────────────────────────────────────
  static const Color white      = Color(0xFFFFFFFF);
  static const Color transparent = Colors.transparent;

  // ── Risk badges ────────────────────────────────────────────────────────
  static const Color riskRed    = Color(0xFFD32F2F);
  static const Color riskYellow = Color(0xFFF9A825);
  static const Color riskGreen  = Color(0xFF388E3C);

  // ── Borders ────────────────────────────────────────────────────────────
  static const Color pinkBorder = Color(0xFFF58D8B);
  static const Color greyBorder = Color(0xFFE0E0E0);

  // ── Gradients ──────────────────────────────────────────────────────────
  static const LinearGradient primaryButtonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [gradStart, gradEnd],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [bgTop, bgBottom],
  );

  static const LinearGradient backgroundGradientBottomPink = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [bgBottom, bgTop],
  );
}
