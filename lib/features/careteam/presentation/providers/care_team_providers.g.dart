// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'care_team_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(careTeamRemoteDataSource)
const careTeamRemoteDataSourceProvider = CareTeamRemoteDataSourceProvider._();

final class CareTeamRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          CareTeamRemoteDataSource,
          CareTeamRemoteDataSource,
          CareTeamRemoteDataSource
        >
    with $Provider<CareTeamRemoteDataSource> {
  const CareTeamRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'careTeamRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$careTeamRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<CareTeamRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CareTeamRemoteDataSource create(Ref ref) {
    return careTeamRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CareTeamRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CareTeamRemoteDataSource>(value),
    );
  }
}

String _$careTeamRemoteDataSourceHash() =>
    r'43c148db6542c5a03f7e1084776360178f24eb7f';

@ProviderFor(careTeamRepository)
const careTeamRepositoryProvider = CareTeamRepositoryProvider._();

final class CareTeamRepositoryProvider
    extends
        $FunctionalProvider<
          CareTeamRepository,
          CareTeamRepository,
          CareTeamRepository
        >
    with $Provider<CareTeamRepository> {
  const CareTeamRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'careTeamRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$careTeamRepositoryHash();

  @$internal
  @override
  $ProviderElement<CareTeamRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CareTeamRepository create(Ref ref) {
    return careTeamRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CareTeamRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CareTeamRepository>(value),
    );
  }
}

String _$careTeamRepositoryHash() =>
    r'dacc24957ff1c8739aea5fd99013a7765cd07f2c';

/// Her care team. Refetches when the app language changes so names switch language.

@ProviderFor(CareTeamController)
const careTeamControllerProvider = CareTeamControllerProvider._();

/// Her care team. Refetches when the app language changes so names switch language.
final class CareTeamControllerProvider
    extends $AsyncNotifierProvider<CareTeamController, CareTeamResponse> {
  /// Her care team. Refetches when the app language changes so names switch language.
  const CareTeamControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'careTeamControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$careTeamControllerHash();

  @$internal
  @override
  CareTeamController create() => CareTeamController();
}

String _$careTeamControllerHash() =>
    r'afb329b9a7b245a1b64a8925a79dbd7af2eb3085';

/// Her care team. Refetches when the app language changes so names switch language.

abstract class _$CareTeamController extends $AsyncNotifier<CareTeamResponse> {
  FutureOr<CareTeamResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<CareTeamResponse>, CareTeamResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CareTeamResponse>, CareTeamResponse>,
              AsyncValue<CareTeamResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Options for the picker sheet. `q` is the (debounced) search text.

@ProviderFor(ashaOptions)
const ashaOptionsProvider = AshaOptionsFamily._();

/// Options for the picker sheet. `q` is the (debounced) search text.

final class AshaOptionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AshaOptionsResponse>,
          AshaOptionsResponse,
          FutureOr<AshaOptionsResponse>
        >
    with
        $FutureModifier<AshaOptionsResponse>,
        $FutureProvider<AshaOptionsResponse> {
  /// Options for the picker sheet. `q` is the (debounced) search text.
  const AshaOptionsProvider._({
    required AshaOptionsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'ashaOptionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ashaOptionsHash();

  @override
  String toString() {
    return r'ashaOptionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AshaOptionsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AshaOptionsResponse> create(Ref ref) {
    final argument = this.argument as String;
    return ashaOptions(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AshaOptionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ashaOptionsHash() => r'cf233296bf235ba1bc93c5881efec133d93d2625';

/// Options for the picker sheet. `q` is the (debounced) search text.

final class AshaOptionsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AshaOptionsResponse>, String> {
  const AshaOptionsFamily._()
    : super(
        retry: null,
        name: r'ashaOptionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Options for the picker sheet. `q` is the (debounced) search text.

  AshaOptionsProvider call(String q) =>
      AshaOptionsProvider._(argument: q, from: this);

  @override
  String toString() => r'ashaOptionsProvider';
}
