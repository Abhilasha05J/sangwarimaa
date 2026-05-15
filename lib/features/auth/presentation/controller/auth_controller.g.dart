// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Auth controller — handles sendOtp and verifyOtp.
///
/// State: AsyncValue<void>
///   - AsyncData(null)    → idle / success
///   - AsyncLoading()     → request in flight
///   - AsyncError(e, st)  → failure, message surfaced via SnackBar in UI
///
/// Replace the TODO stubs with your real AuthRepository calls.

@ProviderFor(AuthController)
const authControllerProvider = AuthControllerProvider._();

/// Auth controller — handles sendOtp and verifyOtp.
///
/// State: AsyncValue<void>
///   - AsyncData(null)    → idle / success
///   - AsyncLoading()     → request in flight
///   - AsyncError(e, st)  → failure, message surfaced via SnackBar in UI
///
/// Replace the TODO stubs with your real AuthRepository calls.
final class AuthControllerProvider
    extends $NotifierProvider<AuthController, AsyncValue<void>> {
  /// Auth controller — handles sendOtp and verifyOtp.
  ///
  /// State: AsyncValue<void>
  ///   - AsyncData(null)    → idle / success
  ///   - AsyncLoading()     → request in flight
  ///   - AsyncError(e, st)  → failure, message surfaced via SnackBar in UI
  ///
  /// Replace the TODO stubs with your real AuthRepository calls.
  const AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$authControllerHash() => r'0eca37fa6a6273fd7f7b83a10beced9c334b4c20';

/// Auth controller — handles sendOtp and verifyOtp.
///
/// State: AsyncValue<void>
///   - AsyncData(null)    → idle / success
///   - AsyncLoading()     → request in flight
///   - AsyncError(e, st)  → failure, message surfaced via SnackBar in UI
///
/// Replace the TODO stubs with your real AuthRepository calls.

abstract class _$AuthController extends $Notifier<AsyncValue<void>> {
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
