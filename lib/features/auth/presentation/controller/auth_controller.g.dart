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

@ProviderFor(AuthController)
const authControllerProvider = AuthControllerProvider._();

/// Auth controller — handles sendOtp and verifyOtp.
///
/// State: AsyncValue<void>
///   - AsyncData(null)    → idle / success
///   - AsyncLoading()     → request in flight
///   - AsyncError(e, st)  → failure, message surfaced via SnackBar in UI
final class AuthControllerProvider
    extends $NotifierProvider<AuthController, AsyncValue<void>> {
  /// Auth controller — handles sendOtp and verifyOtp.
  ///
  /// State: AsyncValue<void>
  ///   - AsyncData(null)    → idle / success
  ///   - AsyncLoading()     → request in flight
  ///   - AsyncError(e, st)  → failure, message surfaced via SnackBar in UI
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

String _$authControllerHash() => r'b7c1f13352b66686a22ac041a08c93d5b81da975';

/// Auth controller — handles sendOtp and verifyOtp.
///
/// State: AsyncValue<void>
///   - AsyncData(null)    → idle / success
///   - AsyncLoading()     → request in flight
///   - AsyncError(e, st)  → failure, message surfaced via SnackBar in UI

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
