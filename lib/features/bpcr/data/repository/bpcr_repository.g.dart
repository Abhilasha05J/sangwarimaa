// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$bpcrRepositoryHash() => r'299b81ba20933bc0d2644a9c72dd205775280c93';
