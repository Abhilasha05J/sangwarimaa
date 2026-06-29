import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/core/network/dio_client.dart';
import 'package:sangwari_maa/features/auth/presentation/provider/auth_providers.dart';
import '../../data/datasource/profile_remote_datasource.dart';
import '../../data/repository/profile_repository.dart';

part 'profile_providers.g.dart';

@riverpod
ProfileRemoteDataSource profileRemoteDataSource(Ref ref) =>
    ProfileRemoteDataSource(DioClient.instance.dio);

@riverpod
ProfileRepository profileRepository(Ref ref) => ProfileRepository(
  ref.watch(profileRemoteDataSourceProvider),
  ref.watch(tokenStorageServiceProvider), // reused from auth_providers.dart
);