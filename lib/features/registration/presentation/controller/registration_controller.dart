import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/features/registration/data/model/women_register_request_model.dart';
import 'package:sangwari_maa/features/registration/presentation/provider/registration_providers.dart';

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

  Future<void> register(WomenRegisterRequestModel request) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await ref.read(registrationRepositoryProvider).registerWoman(request);
      result.fold((failure) => throw failure, (_) {});
    });
  }
}