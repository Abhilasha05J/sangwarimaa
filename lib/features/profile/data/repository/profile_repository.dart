import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sangwari_maa/core/errors/exceptions.dart';
import 'package:sangwari_maa/core/errors/failures.dart';
import 'package:sangwari_maa/core/services/token_storage_service.dart';
import 'package:sangwari_maa/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:sangwari_maa/features/profile/data/model/mitanin_profile_model.dart';
import 'package:sangwari_maa/features/profile/data/model/women_profile_model.dart';


class ProfileRepository {
  final ProfileRemoteDataSource _remote;
  final TokenStorageService _tokenStorage;

  ProfileRepository(this._remote, this._tokenStorage);

  /// Returns true if the user's profile is complete enough to use the app.
  /// A 404 from the backend means no beneficiary/worker record exists yet
  /// (registration was never completed) — returns false, caller routes to
  /// Registration. Any other error (network, 500) propagates as a Failure.
  Future<Either<Failure, bool>> isProfileComplete(String? role) async {
    try {
      if (role == 'asha' || role == 'anm') {
        final response = await _remote.getMitaninProfile();
        final envelope = response.response.data as Map<String, dynamic>;
        final profile = MitaninProfileModel.fromJson(
            envelope['data'] as Map<String, dynamic>);
        return Right(profile.name != null && profile.uniqueId != null);
      } else {
        final response = await _remote.getWomenProfile();
        final envelope = response.response.data as Map<String, dynamic>;
        final data = envelope['data'] as Map<String, dynamic>;
        final profile = WomenProfileDataModel.fromJson(
            data['profile'] as Map<String, dynamic>);
        return Right(profile.name != null && profile.lmp != null);
      }
    } catch (e) {
      // ErrorInterceptor stores NotFoundException inside DioException.error —
      // unwrap it before checking, since `on NotFoundException` won't match
      // the outer DioException wrapper.
      final inner = e is DioException ? e.error : e;
      if (inner is NotFoundException) return const Right(false);
      return Left(mapExceptionToFailure(e));
    }
  }

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

  /// Fetches the mobile number of the current user from the women profile.
  /// Used by resolveDestination when routing an incomplete-profile user to
  /// Registration — so the mobile field can be pre-filled.
  Future<Either<Failure, String?>> getCurrentUserMobile() async {
    try {
      final response = await _remote.getWomenProfile();
      final envelope = response.response.data as Map<String, dynamic>;
      final data = envelope['data'] as Map<String, dynamic>;
      final user = WomenProfileUserModel.fromJson(
          data['user'] as Map<String, dynamic>);
      return Right(user.mobile);
    } catch (e) {
      final inner = e is DioException ? e.error : e;
      if (inner is NotFoundException) return const Right(null);
      return Left(mapExceptionToFailure(e));
    }
  }
}

