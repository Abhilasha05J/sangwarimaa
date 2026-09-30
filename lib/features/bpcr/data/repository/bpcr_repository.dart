import 'package:dartz/dartz.dart';
import 'package:sangwari_maa/core/errors/failures.dart';
import 'package:sangwari_maa/features/bpcr/data/datasource/bpcr_remote_datasource.dart';
import 'package:sangwari_maa/features/bpcr/data/model/bpcr_score_model.dart';

Map<String, dynamic> _unwrap(Map<String, dynamic> json) =>
    (json['data'] as Map<String, dynamic>?) ?? json;

class BpcrRepository {
  final BpcrRemoteDataSource _remote;
  BpcrRepository(this._remote);

  Future<Either<Failure, FacilitiesResponse>> getFacilities({String? q}) async {
    try {
      final res = await _remote.getFacilities(q: q);
      return Right(res.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, void>> saveFacilitySelection(List<String> facilityIds) async {
    try {
      await _remote.saveFacilitySelection({'facility_ids': facilityIds});
      return const Right(null);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, SbaResponse>> getSba() async {
    try {
      final res = await _remote.getSba();
      return Right(res.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, BpcrScoreModel>> getScore() async {
    try {
      final res = await _remote.getScoreRaw();
      return Right(BpcrScoreModel.fromJson(_unwrap(res.data as Map<String, dynamic>)));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, EmergencyHubModel>> getEmergencyHub() async {
    try {
      final res = await _remote.getEmergencyHubRaw();
      return Right(EmergencyHubModel.fromJson(_unwrap(res.data as Map<String, dynamic>)));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> getAnswers(String component) async {
    try {
      final res = await _remote.getAnswers(component);
      return Right(res.data.answers);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, void>> saveAnswers(String component, Map<String, dynamic> answers) async {
    try {
      await _remote.saveAnswers(component, {'answers': answers});
      return const Right(null);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, BloodDonorListResponse>> getBloodDonors() async {
    try {
      final res = await _remote.getBloodDonors();
      return Right(res.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, void>> addBloodDonor({
    required String donorType, required String name, required String bloodGroup,
    String? relation, String? address, required String phone,
  }) async {
    try {
      await _remote.addBloodDonor({
        'donor_type': donorType, 'name': name, 'blood_group': bloodGroup,
        'relation': relation, 'address': address, 'phone': phone,
      });
      return const Right(null);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, void>> deleteBloodDonor(String id) async {
    try {
      await _remote.deleteBloodDonor(id);
      return const Right(null);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }


}
