// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'village_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(villageRemoteDataSource)
const villageRemoteDataSourceProvider = VillageRemoteDataSourceProvider._();

final class VillageRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          VillageRemoteDataSource,
          VillageRemoteDataSource,
          VillageRemoteDataSource
        >
    with $Provider<VillageRemoteDataSource> {
  const VillageRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'villageRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$villageRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<VillageRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  VillageRemoteDataSource create(Ref ref) {
    return villageRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VillageRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VillageRemoteDataSource>(value),
    );
  }
}

String _$villageRemoteDataSourceHash() =>
    r'bf892078c77e90aa6f904213da2328c9c7994066';

@ProviderFor(villageRepository)
const villageRepositoryProvider = VillageRepositoryProvider._();

final class VillageRepositoryProvider
    extends
        $FunctionalProvider<
          VillageRepository,
          VillageRepository,
          VillageRepository
        >
    with $Provider<VillageRepository> {
  const VillageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'villageRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$villageRepositoryHash();

  @$internal
  @override
  $ProviderElement<VillageRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  VillageRepository create(Ref ref) {
    return villageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VillageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VillageRepository>(value),
    );
  }
}

String _$villageRepositoryHash() => r'b34d8e81aadabd159bbac561bdb14f8d7fd60cf9';

/// Debounced search — the picker widget calls `ref.read` on this after a
/// short delay following each keystroke rather than watching it directly,
/// to avoid firing a request per character.

@ProviderFor(villageSearch)
const villageSearchProvider = VillageSearchFamily._();

/// Debounced search — the picker widget calls `ref.read` on this after a
/// short delay following each keystroke rather than watching it directly,
/// to avoid firing a request per character.

final class VillageSearchProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VillageModel>>,
          List<VillageModel>,
          FutureOr<List<VillageModel>>
        >
    with
        $FutureModifier<List<VillageModel>>,
        $FutureProvider<List<VillageModel>> {
  /// Debounced search — the picker widget calls `ref.read` on this after a
  /// short delay following each keystroke rather than watching it directly,
  /// to avoid firing a request per character.
  const VillageSearchProvider._({
    required VillageSearchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'villageSearchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$villageSearchHash();

  @override
  String toString() {
    return r'villageSearchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<VillageModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VillageModel>> create(Ref ref) {
    final argument = this.argument as String;
    return villageSearch(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is VillageSearchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$villageSearchHash() => r'f84dd3a34b5accae1a329e4f888b95e320aad90f';

/// Debounced search — the picker widget calls `ref.read` on this after a
/// short delay following each keystroke rather than watching it directly,
/// to avoid firing a request per character.

final class VillageSearchFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<VillageModel>>, String> {
  const VillageSearchFamily._()
    : super(
        retry: null,
        name: r'villageSearchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Debounced search — the picker widget calls `ref.read` on this after a
  /// short delay following each keystroke rather than watching it directly,
  /// to avoid firing a request per character.

  VillageSearchProvider call(String query) =>
      VillageSearchProvider._(argument: query, from: this);

  @override
  String toString() => r'villageSearchProvider';
}
