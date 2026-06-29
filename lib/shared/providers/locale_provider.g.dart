// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Stores the currently selected app locale.
/// Default: English. Persisted via SharedPreferences across restarts.
/// See LanguageSelectionPage and TopBar for usage.

@ProviderFor(LocaleNotifier)
const localeProvider = LocaleNotifierProvider._();

/// Stores the currently selected app locale.
/// Default: English. Persisted via SharedPreferences across restarts.
/// See LanguageSelectionPage and TopBar for usage.
final class LocaleNotifierProvider
    extends $NotifierProvider<LocaleNotifier, Locale> {
  /// Stores the currently selected app locale.
  /// Default: English. Persisted via SharedPreferences across restarts.
  /// See LanguageSelectionPage and TopBar for usage.
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

String _$localeNotifierHash() => r'01832f0ffe0726e242462dae675f7629c3862fce';

/// Stores the currently selected app locale.
/// Default: English. Persisted via SharedPreferences across restarts.
/// See LanguageSelectionPage and TopBar for usage.

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
