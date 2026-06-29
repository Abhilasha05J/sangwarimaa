import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';

/// Usage: Set [currentIndex] to highlight the active tab.
/// 0 = Home, 1 = Profile, 2 = Reminder, 3 = Chatbot
class AppBottomNavBar extends ConsumerWidget {
  final int currentIndex;

  const AppBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                iconPath: "assets/icons/home.png",
                label: l10n.homeDashboard,
                isActive: currentIndex == 0,
                onTap: () => context.go('/womensdashboard'),
              ),
              _NavItem(
                iconPath: "assets/icons/profile.png",
                label: l10n.myProfile,
                isActive: currentIndex == 1,
                onTap: () => context.go('/womensdashboard/womenprofile'),
              ),
              SizedBox(
                width: 80,
                child: GestureDetector(
                  onTap: () {
                  context.go('/womensdashboard/emergency');

                  },
                  child: Transform.translate(
                    offset: const Offset(0, -25),
                    child: Image.asset(
                      'assets/icons/emergency.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ),
              _NavItem(
                iconPath: "assets/icons/reminder.png",
                label: l10n.reminders,
                isActive: currentIndex == 2,
                onTap: () => context.go('/womensdashboard/womenreminders'),
              ),
              _NavItem(
                iconPath: "assets/icons/chatbot.png",
                label: l10n.chatbot,
                isActive: currentIndex == 3,
                onTap: () => context.go('/womensdashboard/chatbot'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.gradStart : AppColors.hintText;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 20,
              height: 20,
              color: color, // optional
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: color,
                fontSize: 11,
                fontWeight:
                isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}