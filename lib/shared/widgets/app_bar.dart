import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/profile/presentation/provider/profile_providers.dart';

import '../providers/locale_provider.dart';
// ── App Bar ────────────────────────────────────────────────────────────────
class TopBar extends ConsumerWidget implements PreferredSizeWidget {
  final AppLocalizations l10n;
  const TopBar({ super.key, required this.l10n});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Stack(
          alignment: Alignment.center,
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
            // Positioned(
            //     right:20,
            //     child:GestureDetector(
            //       onTap: () {
            //         final currentLocale = ref.read(localeProvider);
            //         ref.read(localeProvider.notifier).setLocale(
            //           currentLocale.languageCode == 'en'
            //               ? const Locale('hi')
            //               : const Locale('en'),
            //         );
            //       },
            //     child: Image.asset(
            //         'assets/icons/language.png',
            //       height: 40,
            //       width: 40,
            //     ),
            //     ),
            // ),
            Positioned(
              right: 20,
              child: GestureDetector(
                onTap: () async {
                  final currentLocale = ref.read(localeProvider);
                  final newLocale = currentLocale.languageCode == 'en'
                      ? const Locale('hi')
                      : const Locale('en');

                  ref.read(localeProvider.notifier).setLocale(newLocale); // instant UI update

                  // Fire-and-forget backend sync — no loading state, no error UI.
                  // If it fails (offline, etc.), the next app action that hits any
                  // profile endpoint will naturally pick up the locally-saved language
                  // next time the user edits their profile. Not worth blocking the UI for.
                  ref.read(profileRepositoryProvider).updatePreferredLanguage(newLocale.languageCode);
                },
                child: Image.asset(
                  'assets/icons/language.png',
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
