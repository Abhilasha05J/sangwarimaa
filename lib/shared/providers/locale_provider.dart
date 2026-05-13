import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kLocaleKey = 'app_locale';

const Locale localeEnglish = Locale('en');
const Locale localeHindi   = Locale('hi');

const List<Locale> supportedLocales = [localeEnglish, localeHindi];

final localeProvider = AsyncNotifierProvider<LocaleNotifier, Locale>(() {
  return LocaleNotifier();
});

class LocaleNotifier extends AsyncNotifier<Locale> {
  @override
  Future<Locale> build() async {
    final prefs = await SharedPreferences.getInstance();
    final code  = prefs.getString(_kLocaleKey);
    return code != null ? Locale(code) : localeHindi;
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLocaleKey, locale.languageCode);
    state = AsyncData(locale);
  }

  Future<void> toggle() async {
    final current = state.value ?? localeHindi;
    await setLocale(current == localeHindi ? localeEnglish : localeHindi);
  }
}