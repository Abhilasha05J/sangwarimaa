import 'package:dartz/dartz.dart';
import 'package:sangwari_maa/core/errors/failures.dart';
import '../datasource/registration_remote_datasource.dart';
import '../model/women_register_request_model.dart';

class RegistrationRepository {
  final RegistrationRemoteDataSource _remote;
  RegistrationRepository(this._remote);

  Future<Either<Failure, void>> registerWoman(WomenRegisterRequestModel request) async {
    try {
      await _remote.registerWoman(request);
      return const Right(null);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}