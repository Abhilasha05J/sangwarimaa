// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anc_services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ancServicesDatasource)
const ancServicesDatasourceProvider = AncServicesDatasourceProvider._();

final class AncServicesDatasourceProvider
    extends
        $FunctionalProvider<
          AncServicesDatasource,
          AncServicesDatasource,
          AncServicesDatasource
        >
    with $Provider<AncServicesDatasource> {
  const AncServicesDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ancServicesDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ancServicesDatasourceHash();

  @$internal
  @override
  $ProviderElement<AncServicesDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AncServicesDatasource create(Ref ref) {
    return ancServicesDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AncServicesDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AncServicesDatasource>(value),
    );
  }
}

String _$ancServicesDatasourceHash() =>
    r'653a5f0814eb10b8c44b531335917cbe6b8f6a03';

@ProviderFor(ancServicesRepository)
const ancServicesRepositoryProvider = AncServicesRepositoryProvider._();

final class AncServicesRepositoryProvider
    extends
        $FunctionalProvider<
          AncServicesRepository,
          AncServicesRepository,
          AncServicesRepository
        >
    with $Provider<AncServicesRepository> {
  const AncServicesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ancServicesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ancServicesRepositoryHash();

  @$internal
  @override
  $ProviderElement<AncServicesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AncServicesRepository create(Ref ref) {
    return ancServicesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AncServicesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AncServicesRepository>(value),
    );
  }
}

String _$ancServicesRepositoryHash() =>
    r'bca5bbce6407d4110a388d5acc417bd58d2b2d9c';
