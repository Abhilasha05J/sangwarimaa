// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_nearest_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Starts on her village (no permission prompt). She can switch to GPS.

@ProviderFor(FacilityOrigin)
const facilityOriginProvider = FacilityOriginProvider._();

/// Starts on her village (no permission prompt). She can switch to GPS.
final class FacilityOriginProvider
    extends $NotifierProvider<FacilityOrigin, FacilityOriginState> {
  /// Starts on her village (no permission prompt). She can switch to GPS.
  const FacilityOriginProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'facilityOriginProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$facilityOriginHash();

  @$internal
  @override
  FacilityOrigin create() => FacilityOrigin();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FacilityOriginState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FacilityOriginState>(value),
    );
  }
}

String _$facilityOriginHash() => r'77861e89ff6a6a27d633c32b004c3a48cea9a64c';

/// Starts on her village (no permission prompt). She can switch to GPS.

abstract class _$FacilityOrigin extends $Notifier<FacilityOriginState> {
  FacilityOriginState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<FacilityOriginState, FacilityOriginState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FacilityOriginState, FacilityOriginState>,
              FacilityOriginState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// The nearest facility of each type (up to 4) for the current origin. Returns null while GPS is
/// still locating or has failed (the section widget shows that state itself).

@ProviderFor(nearestFacilities)
const nearestFacilitiesProvider = NearestFacilitiesProvider._();

/// The nearest facility of each type (up to 4) for the current origin. Returns null while GPS is
/// still locating or has failed (the section widget shows that state itself).

final class NearestFacilitiesProvider
    extends
        $FunctionalProvider<
          AsyncValue<NearestFacilitiesResponse?>,
          NearestFacilitiesResponse?,
          FutureOr<NearestFacilitiesResponse?>
        >
    with
        $FutureModifier<NearestFacilitiesResponse?>,
        $FutureProvider<NearestFacilitiesResponse?> {
  /// The nearest facility of each type (up to 4) for the current origin. Returns null while GPS is
  /// still locating or has failed (the section widget shows that state itself).
  const NearestFacilitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nearestFacilitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nearestFacilitiesHash();

  @$internal
  @override
  $FutureProviderElement<NearestFacilitiesResponse?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NearestFacilitiesResponse?> create(Ref ref) {
    return nearestFacilities(ref);
  }
}

String _$nearestFacilitiesHash() => r'f0364a2e68e9900542f9e6be104fafddc1fa668c';

/// Which nearest-facility card she tapped "Show route" on (null = none).

@ProviderFor(RouteTarget)
const routeTargetProvider = RouteTargetProvider._();

/// Which nearest-facility card she tapped "Show route" on (null = none).
final class RouteTargetProvider
    extends $NotifierProvider<RouteTarget, String?> {
  /// Which nearest-facility card she tapped "Show route" on (null = none).
  const RouteTargetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routeTargetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routeTargetHash();

  @$internal
  @override
  RouteTarget create() => RouteTarget();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$routeTargetHash() => r'4c3372e41a73b47eb5bc8511aa75f0002167e2a1';

/// Which nearest-facility card she tapped "Show route" on (null = none).

abstract class _$RouteTarget extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Road route from her origin to the tapped facility. Fetched only when a card's
/// "Show route" is tapped; null while nothing is selected.

@ProviderFor(facilityRoute)
const facilityRouteProvider = FacilityRouteProvider._();

/// Road route from her origin to the tapped facility. Fetched only when a card's
/// "Show route" is tapped; null while nothing is selected.

final class FacilityRouteProvider
    extends
        $FunctionalProvider<
          AsyncValue<FacilityRouteResponse?>,
          FacilityRouteResponse?,
          FutureOr<FacilityRouteResponse?>
        >
    with
        $FutureModifier<FacilityRouteResponse?>,
        $FutureProvider<FacilityRouteResponse?> {
  /// Road route from her origin to the tapped facility. Fetched only when a card's
  /// "Show route" is tapped; null while nothing is selected.
  const FacilityRouteProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'facilityRouteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$facilityRouteHash();

  @$internal
  @override
  $FutureProviderElement<FacilityRouteResponse?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FacilityRouteResponse?> create(Ref ref) {
    return facilityRoute(ref);
  }
}

String _$facilityRouteHash() => r'187052783acaf61521c00fceb7df01261971fc7c';
