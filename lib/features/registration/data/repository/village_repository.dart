import 'package:dartz/dartz.dart';
import 'package:sangwari_maa/core/errors/failures.dart';
import '../datasource/village_remote_datasource.dart';
import '../model/village_model.dart';

class VillageRepository {
  final VillageRemoteDataSource _remote;
  VillageRepository(this._remote);

  Future<Either<Failure, List<VillageModel>>> searchVillages({
    String? q,
    String? block,
  }) async {
    try {
      final res = await _remote.searchVillages(q: q, block: block);
      return Right(res.data.villages);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
