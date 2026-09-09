import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/core/network/dio_client.dart';
import 'package:sangwari_maa/features/auth/presentation/provider/auth_providers.dart';
import 'package:sangwari_maa/features/profile/data/model/women_profile_model.dart';
import 'package:sangwari_maa/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:sangwari_maa/features/profile/data/repository/profile_repository.dart';

part 'profile_providers.g.dart';

@riverpod
ProfileRemoteDataSource profileRemoteDataSource(Ref ref) =>
    ProfileRemoteDataSource(DioClient.instance.dio);

@riverpod
ProfileRepository profileRepository(Ref ref) => ProfileRepository(
  ref.watch(profileRemoteDataSourceProvider),
  ref.watch(tokenStorageServiceProvider), // reused from auth_providers.dart
);


@riverpod
class WomenProfileController extends _$WomenProfileController {
  @override
  Future<WomenProfileModel> build() async {
    final result = await ref.watch(profileRepositoryProvider).getWomenProfile();
    return result.fold(
          (failure) => throw failure,
          (profile) => profile,
    );
  }

  /// Pull-to-refresh / retry-after-error entry point.
  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}