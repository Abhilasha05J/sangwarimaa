import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

/// Auth controller — handles sendOtp and verifyOtp.
///
/// State: AsyncValue<void>
///   - AsyncData(null)    → idle / success
///   - AsyncLoading()     → request in flight
///   - AsyncError(e, st)  → failure, message surfaced via SnackBar in UI
///
/// Replace the TODO stubs with your real AuthRepository calls.
@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  /// Sends an OTP to [mobile].
  /// On success the UI listens and navigates to /login/otp.
  Future<void> sendOtp(String mobile) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // TODO: await ref.read(authRepositoryProvider).sendOtp(mobile);
      await Future.delayed(const Duration(seconds: 1)); // stub
    });
  }

  /// Verifies [otp] for [mobile].
  /// On success the UI listens and navigates to /dashboard.
  Future<void> verifyOtp(String mobile, String otp) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // TODO: await ref.read(authRepositoryProvider).verifyOtp(mobile, otp);
      await Future.delayed(const Duration(seconds: 1)); // stub
    });
  }
}
