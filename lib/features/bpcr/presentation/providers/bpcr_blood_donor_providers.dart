import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_providers.dart';
import '../../data/datasource/bpcr_remote_datasource.dart';

part 'bpcr_blood_donor_providers.g.dart';

@riverpod
class BpcrBloodDonors extends _$BpcrBloodDonors {
  @override
  Future<BloodDonorListResponse> build() async {
    final result = await ref.read(bpcrRepositoryProvider).getBloodDonors();
    return result.fold((f) => throw f, (r) => r);
  }

  Future<bool> add({
    required String donorType, required String name, required String bloodGroup,
    String? relation, String? address, required String phone,
  }) async {
    final result = await ref.read(bpcrRepositoryProvider).addBloodDonor(
      donorType: donorType, name: name, bloodGroup: bloodGroup,
      relation: relation, address: address, phone: phone,
    );
    return result.fold((f) => false, (_) {
      ref.invalidateSelf();
      return true;
    });
  }

  Future<bool> remove(String id) async {
    final result = await ref.read(bpcrRepositoryProvider).deleteBloodDonor(id);
    return result.fold((f) => false, (_) {
      ref.invalidateSelf();
      return true;
    });
  }
}