import 'package:dartz/dartz.dart';
import 'package:sangwari_maa/core/errors/failures.dart';
import 'package:sangwari_maa/features/careteam/data/model/care_team_models.dart';

import '../datasource/care_team_remote_datasource.dart';

class CareTeamRepository {
  final CareTeamRemoteDataSource _remote;
  CareTeamRepository(this._remote);

  Future<Either<Failure, AshaOptionsResponse>> getOptions({
    String? q,
    required String lang,
    int limit = 30,
  }) async {
    try {
      final res = await _remote.getOptions(
        q: (q == null || q.isEmpty) ? null : q,
        lang: lang,
        limit: limit,
      );
      return Right(res.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  Future<Either<Failure, CareTeamResponse>> getCareTeam({required String lang}) async {
    try {
      final res = await _remote.getCareTeam(lang: lang);
      return Right(res.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  /// Saves primary + backups in one call (the Save button). Returns the new care team.
  Future<Either<Failure, CareTeamResponse>> saveCareTeam({
    required String primaryId,
    required List<String> backupIds,
    required String lang,
  }) async {
    try {
      final res = await _remote.saveCareTeam(
        {'mitanin_id': primaryId, 'backup_mitanin_ids': backupIds},
        lang: lang,
      );
      return Right(res.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
