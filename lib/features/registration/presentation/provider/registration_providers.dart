import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/core/network/dio_client.dart';
import '../../data/datasource/registration_remote_datasource.dart';
import '../../data/repository/registration_repository.dart';

part 'registration_providers.g.dart';

@riverpod
RegistrationRemoteDataSource registrationRemoteDataSource(Ref ref) =>
    RegistrationRemoteDataSource(DioClient.instance.dio);

@riverpod
RegistrationRepository registrationRepository(Ref ref) =>
    RegistrationRepository(ref.watch(registrationRemoteDataSourceProvider));