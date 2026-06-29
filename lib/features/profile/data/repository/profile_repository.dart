import 'package:dartz/dartz.dart';
import 'package:sangwari_maa/core/errors/failures.dart';
import 'package:sangwari_maa/core/services/token_storage_service.dart';
import '../datasource/profile_remote_datasource.dart';

class ProfileRepository {
  final ProfileRemoteDataSource _remote;
  final TokenStorageService _tokenStorage;

  ProfileRepository(this._remote, this._tokenStorage);

  /// Syncs the locally-selected language to the backend so SMS/notifications
  /// respect it. Picks the right endpoint based on the stored user role.
  /// No-ops silently if there's no session — pre-login toggling never calls this.
  Future<Either<Failure, void>> updatePreferredLanguage(String languageCode) async {
    try {
      final role = await _tokenStorage.role;
      if (role == null) return const Right(null); // not logged in — nothing to sync

      final body = {'preferred_language': languageCode};
      if (role == 'asha' || role == 'anm') {
        await _remote.updateMitaninProfile(body);
      } else {
        await _remote.updateWomenProfile(body);
      }
      return const Right(null);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}