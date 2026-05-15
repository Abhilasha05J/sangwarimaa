import 'package:flutter/material.dart';

/// The Sangwari Maa logo — used on Splash, Language, and Login screens.
/// Shows assets/images/logo.png in a fixed size.
class AppLogoHeader extends StatelessWidget {
  final double width;
  final double height;
  const AppLogoHeader({super.key, this.width = 160, this.height = 160});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/app_logo.png',
        width: width,
        height: height,
        fit: BoxFit.contain,
        semanticLabel: 'Sangwari Maa logo',
      ),
    );
  }
}