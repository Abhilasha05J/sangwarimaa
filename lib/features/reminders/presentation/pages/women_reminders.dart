import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';

class WomenRemindersScreen extends ConsumerWidget {
  const WomenRemindersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // ── Sub header with back arrow ────────────────────────────────
            _SubHeader(
              title: l10n.reminders,
              onBack: () => context.pop(),
            ),

          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 2,),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sub header (back arrow + title) — light blue strip under TopBar
// ─────────────────────────────────────────────────────────────────────────────
class _SubHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const _SubHeader({required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFE8F1FB),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.bodyText,
              size: 22,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(title, style: AppTypography.titleLarge.copyWith(fontSize: 18)),
        ],
      ),
    );
  }
}
