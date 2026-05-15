// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Stores the currently selected app locale.
/// Default: English.
/// Persisted via SharedPreferences on first language selection.
/// See LanguageSelectionPage for usage.

@ProviderFor(LocaleNotifier)
const localeProvider = LocaleNotifierProvider._();

/// Stores the currently selected app locale.
/// Default: English.
/// Persisted via SharedPreferences on first language selection.
/// See LanguageSelectionPage for usage.
final class LocaleNotifierProvider
    extends $NotifierProvider<LocaleNotifier, Locale> {
  /// Stores the currently selected app locale.
  /// Default: English.
  /// Persisted via SharedPreferences on first language selection.
  /// See LanguageSelectionPage for usage.
  const LocaleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeNotifierHash();

  @$internal
  @override
  LocaleNotifier create() => LocaleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$localeNotifierHash() => r'a504fdbdd7924b8d6b2348c073b4e7a04deb2a84';

/// Stores the currently selected app locale.
/// Default: English.
/// Persisted via SharedPreferences on first language selection.
/// See LanguageSelectionPage for usage.

abstract class _$LocaleNotifier extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Locale, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale, Locale>,
              Locale,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
