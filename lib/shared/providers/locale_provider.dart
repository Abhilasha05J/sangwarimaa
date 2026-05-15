import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

/// Stores the currently selected app locale.
/// Default: English.
/// Persisted via SharedPreferences on first language selection.
/// See LanguageSelectionPage for usage.
@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() => const Locale('en');

  void setLocale(Locale locale) => state = locale;
}
