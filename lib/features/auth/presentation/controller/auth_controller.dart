import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/features/auth/data/model/user_model.dart';
import 'package:sangwari_maa/features/auth/presentation/provider/auth_providers.dart';
part 'auth_controller.g.dart';

/// Auth controller — handles sendOtp and verifyOtp.
///
/// State: AsyncValue<void>
///   - AsyncData(null)    → idle / success
///   - AsyncLoading()     → request in flight
///   - AsyncError(e, st)  → failure, message surfaced via SnackBar in UI

@riverpod
class AuthController extends _$AuthController {
  /// Set by [verifyOtp] just before state flips to success.
  /// Read this from the listener's `data:` branch to decide routing
  /// (registration vs dashboard).
  bool isNewUser = false;
  UserRole? role;

  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> sendOtp(String mobile) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await ref.read(authRepositoryProvider).sendOtp(mobile);
      result.fold((failure) => throw failure, (_) {});
    });
  }

  Future<void> verifyOtp(String mobile, String otp) async {
    state = const AsyncLoading();
    final result = await ref.read(authRepositoryProvider).verifyOtp(mobile: mobile, otp: otp);
    state = result.fold(
          (failure) => AsyncError(failure, StackTrace.current),
          (auth) {
        isNewUser = auth.isNewUser;
        role = auth.user.role;
        return const AsyncData(null);
      },
    );
  }
}