import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/core/network/dio_client.dart';
import '../../data/datasource/village_remote_datasource.dart';
import '../../data/repository/village_repository.dart';
import '../../data/model/village_model.dart';

part 'village_providers.g.dart';

@riverpod
VillageRemoteDataSource villageRemoteDataSource(Ref ref) =>
    VillageRemoteDataSource(DioClient.instance.dio);

@riverpod
VillageRepository villageRepository(Ref ref) =>
    VillageRepository(ref.watch(villageRemoteDataSourceProvider));

/// Debounced search — the picker widget calls `ref.read` on this after a
/// short delay following each keystroke rather than watching it directly,
/// to avoid firing a request per character.
@riverpod
Future<List<VillageModel>> villageSearch(Ref ref, String query) async {
  final result = await ref.read(villageRepositoryProvider).searchVillages(q: query);
  return result.fold((failure) => throw failure, (villages) => villages);
}
