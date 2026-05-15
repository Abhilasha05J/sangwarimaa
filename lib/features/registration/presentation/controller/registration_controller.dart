import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registration_controller.g.dart';

/// Registration controller — handles women self-registration form submission.
///
/// State: AsyncValue<void>
///   - AsyncData(null)    → idle / success
///   - AsyncLoading()     → request in flight
///   - AsyncError(e, st)  → validation / network failure
@riverpod
class RegistrationController extends _$RegistrationController {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> register({
    required String name,
    required String mobile,
    required int age,
    required int husbandAge,
    required String dob,
    required String address,
    required String bloodGroup,
    required int gestationalAge,
    required String lmp,
    required String edd,
    required String village,
    required String phc,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // TODO: await ref.read(registrationRepositoryProvider).register(...)
      await Future.delayed(const Duration(seconds: 1)); // stub
    });
  }
}
