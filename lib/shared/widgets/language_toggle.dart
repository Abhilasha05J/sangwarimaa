import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/shared/providers/locale_provider.dart';

class LanguageToggleButton extends ConsumerWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeAsync = ref.watch(localeProvider);
    final notifier    = ref.read(localeProvider.notifier);

    final isHindi = (localeAsync.value ?? localeHindi) == localeHindi;

    return TextButton(
      onPressed: notifier.toggle,
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      child: Text(
        isHindi ? 'English' : 'हिंदी',
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    );
  }
}

class LanguageSelectorCard extends ConsumerWidget {
  const LanguageSelectorCard({super.key, this.onSelected});

  final void Function(Locale locale)? onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeAsync   = ref.watch(localeProvider);
    final notifier      = ref.read(localeProvider.notifier);
    final currentLocale = localeAsync.value ?? localeHindi;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: supportedLocales.map((locale) {
          final isSelected = locale == currentLocale;
          final label      = locale.languageCode == 'hi' ? 'हिंदी' : 'English';
          final sublabel   = locale.languageCode == 'hi' ? 'Hindi' : 'अंग्रेज़ी';

          return ListTile(
            leading: Radio<Locale>(
              value: locale,
              groupValue: currentLocale,
              onChanged: (v) async {
                if (v != null) {
                  await notifier.setLocale(v);
                  onSelected?.call(v);
                }
              },
            ),
            title: Text(
              label,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            subtitle: Text(sublabel),
            onTap: () async {
              await notifier.setLocale(locale);
              onSelected?.call(locale);
            },
          );
        }).toList(),
      ),
    );
  }
}