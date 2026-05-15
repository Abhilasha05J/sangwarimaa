import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';

class WomensDashboard extends ConsumerWidget {
  const WomensDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopBar(l10n: l10n),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text('🎉 Registration Complete!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const Text('womens Dashboard coming soon.',
            style: TextStyle(color: Color(0xFF747474))),
          ]

        ),
      )
    );
  }
}