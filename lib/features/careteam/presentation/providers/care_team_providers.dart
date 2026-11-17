import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/core/network/dio_client.dart'; // VERIFY: the file that defines your Dio provider
import 'package:sangwari_maa/features/careteam/data/datasource/care_team_remote_datasource.dart';
import 'package:sangwari_maa/features/careteam/data/model/care_team_models.dart';
import 'package:sangwari_maa/features/careteam/data/repository/care_team_repository.dart';
import 'package:sangwari_maa/shared/providers/locale_provider.dart';

part 'care_team_providers.g.dart';

@riverpod
CareTeamRemoteDataSource careTeamRemoteDataSource(Ref ref) {
  // VERIFY: use the same Dio provider your BPCR remote datasource provider uses.
  final Dio dio = ref.watch(dioProvider);
  return CareTeamRemoteDataSource(dio);
}

@riverpod
CareTeamRepository careTeamRepository(Ref ref) =>
    CareTeamRepository(ref.watch(careTeamRemoteDataSourceProvider));

/// Her care team. Refetches when the app language changes so names switch language.
@riverpod
class CareTeamController extends _$CareTeamController {
  @override
  Future<CareTeamResponse> build() async {
    final lang = ref.watch(localeProvider).languageCode;
    final result = await ref.read(careTeamRepositoryProvider).getCareTeam(lang: lang);
    return result.fold((failure) => throw failure, (data) => data);
  }

  /// Returns true on success. The PUT already returns the new care team, so no refetch is needed.
  Future<bool> save({required String primaryId, String? backupId}) async {
    final lang = ref.read(localeProvider).languageCode;
    final result = await ref.read(careTeamRepositoryProvider).saveCareTeam(
      primaryId: primaryId,
      backupIds: backupId == null ? <String>[] : <String>[backupId],
      lang: lang,
    );
    return result.fold((_) => false, (data) {
      state = AsyncData(data);
      return true;
    });
  }
}

/// Options for the picker sheet. `q` is the (debounced) search text.
@riverpod
Future<AshaOptionsResponse> ashaOptions(Ref ref, String q) async {
  final lang = ref.watch(localeProvider).languageCode;
  final result = await ref.read(careTeamRepositoryProvider).getOptions(q: q, lang: lang);
  return result.fold((failure) => throw failure, (data) => data);
}