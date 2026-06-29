import 'package:dartz/dartz.dart';
import 'package:sangwari_maa/core/errors/failures.dart';
import 'package:sangwari_maa/core/services/token_storage_service.dart';
import 'package:sangwari_maa/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:sangwari_maa/features/auth/data/model/auth_response_model.dart';
import 'package:sangwari_maa/features/auth/data/model/user_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _remote;
  final TokenStorageService _tokenStorage;

  AuthRepository(this._remote, this._tokenStorage);

  Future<Either<Failure, void>> sendOtp(String mobile) async {
    try {
      await _remote.sendOtp({'mobile': mobile});
      return const Right(null);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, AuthResponseModel>> verifyOtp({
    required String mobile,
    required String otp,
  }) async {
    try {
      final response = await _remote.verifyOtp({'mobile': mobile, 'otp': otp});
      final envelope = response.response.data as Map<String, dynamic>;
      final auth = AuthResponseModel.fromJson(envelope['data'] as Map<String, dynamic>);
      await _tokenStorage.saveTokens(
        accessToken: auth.tokens.accessToken,
        refreshToken: auth.tokens.refreshToken,
      );
      await _tokenStorage.saveRole(auth.user.role.name);
      return Right(auth);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, UserModel>> getCurrentUser() async {
    try {
      final response = await _remote.getMe();
      final envelope = response.response.data as Map<String, dynamic>;
      return Right(UserModel.fromJson(envelope['data'] as Map<String, dynamic>));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, void>> logout() async {
    try {
      await _remote.logout();
      await _tokenStorage.clear();
      return const Right(null);
    } catch (e) {
      await _tokenStorage.clear();
      return Left(mapExceptionToFailure(e));
    }
  }



  Future<Either<Failure, void>> updateFcmToken(String token) async {
    try {
      await _remote.updateFcmToken({'fcm_token': token});
      return const Right(null);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}