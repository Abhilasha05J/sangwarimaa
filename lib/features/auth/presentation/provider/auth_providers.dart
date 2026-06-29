import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sangwari_maa/core/network/dio_client.dart';
import 'package:sangwari_maa/core/services/token_storage_service.dart';
import '../../data/datasource/auth_remote_datasource.dart';
import '../../data/repository/auth_repository.dart';

part 'auth_providers.g.dart';

@riverpod
TokenStorageService tokenStorageService(Ref ref) =>
    const TokenStorageService(FlutterSecureStorage());

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) =>
    AuthRemoteDataSource(DioClient.instance.dio);

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepository(
  ref.watch(authRemoteDataSourceProvider),
  ref.watch(tokenStorageServiceProvider),
);