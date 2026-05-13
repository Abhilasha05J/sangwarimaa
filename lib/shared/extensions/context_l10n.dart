import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';

/// Adds `.l10n` shorthand to [BuildContext].
///
/// Usage anywhere inside a widget tree:
/// ```dart
/// Text(context.l10n.welcomeGreeting)
/// Text(context.l10n.otpSentTo(mobile))
/// Text(context.l10n.bpcrScoreValue(score))
/// ```
extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
