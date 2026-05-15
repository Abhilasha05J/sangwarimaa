import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';

/// Wraps every screen with the brand top-pink → white gradient background.
/// Never use Scaffold(backgroundColor:) alone — always use this widget.
class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: child,
      );
}
