// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Registration controller — handles women self-registration form submission.
///
/// State: AsyncValue<void>
///   - AsyncData(null)    → idle / success
///   - AsyncLoading()     → request in flight
///   - AsyncError(e, st)  → validation / network failure

@ProviderFor(RegistrationController)
const registrationControllerProvider = RegistrationControllerProvider._();

/// Registration controller — handles women self-registration form submission.
///
/// State: AsyncValue<void>
///   - AsyncData(null)    → idle / success
///   - AsyncLoading()     → request in flight
///   - AsyncError(e, st)  → validation / network failure
final class RegistrationControllerProvider
    extends $NotifierProvider<RegistrationController, AsyncValue<void>> {
  /// Registration controller — handles women self-registration form submission.
  ///
  /// State: AsyncValue<void>
  ///   - AsyncData(null)    → idle / success
  ///   - AsyncLoading()     → request in flight
  ///   - AsyncError(e, st)  → validation / network failure
  const RegistrationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registrationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registrationControllerHash();

  @$internal
  @override
  RegistrationController create() => RegistrationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$registrationControllerHash() =>
    r'1a04ad7adfddec3a114c7e2bdf5212036b83f98c';

/// Registration controller — handles women self-registration form submission.
///
/// State: AsyncValue<void>
///   - AsyncData(null)    → idle / success
///   - AsyncLoading()     → request in flight
///   - AsyncError(e, st)  → validation / network failure

abstract class _$RegistrationController extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
