// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(registrationRemoteDataSource)
const registrationRemoteDataSourceProvider =
    RegistrationRemoteDataSourceProvider._();

final class RegistrationRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          RegistrationRemoteDataSource,
          RegistrationRemoteDataSource,
          RegistrationRemoteDataSource
        >
    with $Provider<RegistrationRemoteDataSource> {
  const RegistrationRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registrationRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registrationRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<RegistrationRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RegistrationRemoteDataSource create(Ref ref) {
    return registrationRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegistrationRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegistrationRemoteDataSource>(value),
    );
  }
}

String _$registrationRemoteDataSourceHash() =>
    r'ce61f0eb0aa1ea62649d05cf1c16af5e55cc158b';

@ProviderFor(registrationRepository)
const registrationRepositoryProvider = RegistrationRepositoryProvider._();

final class RegistrationRepositoryProvider
    extends
        $FunctionalProvider<
          RegistrationRepository,
          RegistrationRepository,
          RegistrationRepository
        >
    with $Provider<RegistrationRepository> {
  const RegistrationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registrationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registrationRepositoryHash();

  @$internal
  @override
  $ProviderElement<RegistrationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RegistrationRepository create(Ref ref) {
    return registrationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegistrationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegistrationRepository>(value),
    );
  }
}

String _$registrationRepositoryHash() =>
    r'a8030b1de6f9857dbbcfad952a67a8a8d79f3144';
