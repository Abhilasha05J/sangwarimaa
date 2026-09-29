import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/core/network/dio_client.dart';
import '../../data/datasource/bpcr_remote_datasource.dart';
import '../../data/repository/bpcr_repository.dart';

part 'bpcr_providers.g.dart';

@riverpod
BpcrRemoteDataSource bpcrRemoteDataSource(Ref ref) => BpcrRemoteDataSource(DioClient.instance.dio);

@riverpod
BpcrRepository bpcrRepository(Ref ref) => BpcrRepository(ref.watch(bpcrRemoteDataSourceProvider));

/// Search box text on the Health Facility ID screen. Empty = show catchment
/// only (matches the backend: `results` is empty until she searches).
@riverpod
class FacilitySearchQuery extends _$FacilitySearchQuery {
  @override
  String build() => '';
  void set(String v) => state = v;
}

@riverpod
Future<FacilitiesResponse> bpcrFacilities(Ref ref) async {
  final query = ref.watch(facilitySearchQueryProvider);
  final result = await ref.read(bpcrRepositoryProvider).getFacilities(q: query.isEmpty ? null : query);
  return result.fold((f) => throw f, (r) => r);
}

/// Local selection state, seeded from the server's `selected` list the
/// first time facilities load, then edited locally by ticking cards.
/// Call save() to persist; that also refreshes bpcrFacilities and bpcrSba
/// so the SBA screen reflects the new selection immediately.
@riverpod
class BpcrFacilitySelection extends _$BpcrFacilitySelection {
  bool _seeded = false;

  @override
  // Set<String> build() {
  //   final async = ref.watch(bpcrFacilitiesProvider);
  //   if (!_seeded) {
  //     async.whenData((data) {
  //       _seeded = true;
  //       state = data.selected.map((f) => f.id).toSet();
  //     });
  //   }
  //   return state;
  // }
  @override
  Set<String> build() {
    ref.listen(bpcrFacilitiesProvider, (_, next) {
      if (_seeded) return;
      next.whenData((data) {
        _seeded = true;
        state = data.selected.map((f) => f.id).toSet();
      });
    });

    final current = ref.read(bpcrFacilitiesProvider).asData?.value;
    if (current != null) {
      _seeded = true;
      return current.selected.map((f) => f.id).toSet();
    }
    return <String>{};
  }

  void toggle(String facilityId) {
    final next = {...state};
    next.contains(facilityId) ? next.remove(facilityId) : next.add(facilityId);
    state = next;
  }

  Future<bool> save() async {
    final result = await ref.read(bpcrRepositoryProvider).saveFacilitySelection(state.toList());
    return result.fold((f) => false, (_) {
      ref.invalidate(bpcrFacilitiesProvider);
      ref.invalidate(bpcrSbaProvider);
      return true;
    });
  }
}

@riverpod
Future<SbaResponse> bpcrSba(Ref ref) async {
  final result = await ref.read(bpcrRepositoryProvider).getSba();
  return result.fold((f) => throw f, (r) => r);
}
