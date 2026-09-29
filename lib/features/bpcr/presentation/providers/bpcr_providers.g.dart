// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bpcrRemoteDataSource)
const bpcrRemoteDataSourceProvider = BpcrRemoteDataSourceProvider._();

final class BpcrRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          BpcrRemoteDataSource,
          BpcrRemoteDataSource,
          BpcrRemoteDataSource
        >
    with $Provider<BpcrRemoteDataSource> {
  const BpcrRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bpcrRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bpcrRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<BpcrRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BpcrRemoteDataSource create(Ref ref) {
    return bpcrRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BpcrRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BpcrRemoteDataSource>(value),
    );
  }
}

String _$bpcrRemoteDataSourceHash() =>
    r'bd7b55e279ec587183edfdc1680db8987216e7d0';

@ProviderFor(bpcrRepository)
const bpcrRepositoryProvider = BpcrRepositoryProvider._();

final class BpcrRepositoryProvider
    extends $FunctionalProvider<BpcrRepository, BpcrRepository, BpcrRepository>
    with $Provider<BpcrRepository> {
  const BpcrRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bpcrRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bpcrRepositoryHash();

  @$internal
  @override
  $ProviderElement<BpcrRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BpcrRepository create(Ref ref) {
    return bpcrRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BpcrRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BpcrRepository>(value),
    );
  }
}

String _$bpcrRepositoryHash() => r'f90faeb621ad3685a5734a8ac71bea9cc9f46f5f';

/// Search box text on the Health Facility ID screen. Empty = show catchment
/// only (matches the backend: `results` is empty until she searches).

@ProviderFor(FacilitySearchQuery)
const facilitySearchQueryProvider = FacilitySearchQueryProvider._();

/// Search box text on the Health Facility ID screen. Empty = show catchment
/// only (matches the backend: `results` is empty until she searches).
final class FacilitySearchQueryProvider
    extends $NotifierProvider<FacilitySearchQuery, String> {
  /// Search box text on the Health Facility ID screen. Empty = show catchment
  /// only (matches the backend: `results` is empty until she searches).
  const FacilitySearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'facilitySearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$facilitySearchQueryHash();

  @$internal
  @override
  FacilitySearchQuery create() => FacilitySearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$facilitySearchQueryHash() =>
    r'c504096cdbc05fdd6bb6b1e2b988b14545b22ce7';

/// Search box text on the Health Facility ID screen. Empty = show catchment
/// only (matches the backend: `results` is empty until she searches).

abstract class _$FacilitySearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(bpcrFacilities)
const bpcrFacilitiesProvider = BpcrFacilitiesProvider._();

final class BpcrFacilitiesProvider
    extends
        $FunctionalProvider<
          AsyncValue<FacilitiesResponse>,
          FacilitiesResponse,
          FutureOr<FacilitiesResponse>
        >
    with
        $FutureModifier<FacilitiesResponse>,
        $FutureProvider<FacilitiesResponse> {
  const BpcrFacilitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bpcrFacilitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bpcrFacilitiesHash();

  @$internal
  @override
  $FutureProviderElement<FacilitiesResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FacilitiesResponse> create(Ref ref) {
    return bpcrFacilities(ref);
  }
}

String _$bpcrFacilitiesHash() => r'a2f5fec99f794e7dd513fa1921058177853ddf27';

/// Local selection state, seeded from the server's `selected` list the
/// first time facilities load, then edited locally by ticking cards.
/// Call save() to persist; that also refreshes bpcrFacilities and bpcrSba
/// so the SBA screen reflects the new selection immediately.

@ProviderFor(BpcrFacilitySelection)
const bpcrFacilitySelectionProvider = BpcrFacilitySelectionProvider._();

/// Local selection state, seeded from the server's `selected` list the
/// first time facilities load, then edited locally by ticking cards.
/// Call save() to persist; that also refreshes bpcrFacilities and bpcrSba
/// so the SBA screen reflects the new selection immediately.
final class BpcrFacilitySelectionProvider
    extends $NotifierProvider<BpcrFacilitySelection, Set<String>> {
  /// Local selection state, seeded from the server's `selected` list the
  /// first time facilities load, then edited locally by ticking cards.
  /// Call save() to persist; that also refreshes bpcrFacilities and bpcrSba
  /// so the SBA screen reflects the new selection immediately.
  const BpcrFacilitySelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bpcrFacilitySelectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bpcrFacilitySelectionHash();

  @$internal
  @override
  BpcrFacilitySelection create() => BpcrFacilitySelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$bpcrFacilitySelectionHash() =>
    r'9618058510f64e3578a3a9ea5b6bf0eb1e42efad';

/// Local selection state, seeded from the server's `selected` list the
/// first time facilities load, then edited locally by ticking cards.
/// Call save() to persist; that also refreshes bpcrFacilities and bpcrSba
/// so the SBA screen reflects the new selection immediately.

abstract class _$BpcrFacilitySelection extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(bpcrSba)
const bpcrSbaProvider = BpcrSbaProvider._();

final class BpcrSbaProvider
    extends
        $FunctionalProvider<
          AsyncValue<SbaResponse>,
          SbaResponse,
          FutureOr<SbaResponse>
        >
    with $FutureModifier<SbaResponse>, $FutureProvider<SbaResponse> {
  const BpcrSbaProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bpcrSbaProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bpcrSbaHash();

  @$internal
  @override
  $FutureProviderElement<SbaResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SbaResponse> create(Ref ref) {
    return bpcrSba(ref);
  }
}

String _$bpcrSbaHash() => r'2e335d9c9d7eee50be5063161f044df6f5aa85d6';
