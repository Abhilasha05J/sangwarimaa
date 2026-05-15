import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
// ── App Bar ────────────────────────────────────────────────────────────────
class TopBar extends StatelessWidget
    implements PreferredSizeWidget {
  final AppLocalizations l10n;
  const TopBar({required this.l10n});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Column(
          children: [
            // Brand row
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenH, vertical: AppSpacing.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sangwari', style: AppTypography.brandSangwari),
                  const SizedBox(width: 4),
                  Text('MAA', style: AppTypography.brandMaa),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
