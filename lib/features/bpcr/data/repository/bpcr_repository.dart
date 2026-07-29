import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bpcr_repository.g.dart';

/// BPCR repository interface.
///
/// STATUS: NOT IMPLEMENTED. Endpoint contracts, request/response shapes, and
/// scoring rules are pending client confirmation (see bpcr_assessments table
/// notes). All methods throw until backend work is greenlit. Wiring these up
/// is a drop-in replacement for the local-only Riverpod state used today.
abstract class BpcrRepository {
  Future<void> submitDangerSignsPregnancy(Set<int> acknowledgedIndices);
  Future<void> submitDangerSignsLabor(Set<int> acknowledgedIndices);
  Future<void> submitDangerSignsPostnatal(Set<int> acknowledgedIndices);
  Future<void> submitDangerSignsNewborn(Set<int> acknowledgedIndices);
  Future<void> submitHealthFacilityId(String facilityId);
  Future<void> submitSkillBirthAttendant(Map<String, dynamic> data);
  Future<void> submitTransportModality(Map<String, dynamic> data);
  Future<void> submitSavedMoneyDelivery(Map<String, dynamic> data);
  Future<void> submitCommunityFinancialSupport(Map<String, dynamic> data);
  Future<void> submitCommunityBloodDonor(Map<String, dynamic> data);
}

class BpcrRepositoryImpl implements BpcrRepository {
  const BpcrRepositoryImpl();

  @override
  Future<void> submitDangerSignsPregnancy(Set<int> acknowledgedIndices) =>
      throw UnimplementedError('Pending backend API confirmation.');

  @override
  Future<void> submitDangerSignsLabor(Set<int> acknowledgedIndices) =>
      throw UnimplementedError('Pending backend API confirmation.');

  @override
  Future<void> submitDangerSignsPostnatal(Set<int> acknowledgedIndices) =>
      throw UnimplementedError('Pending backend API confirmation.');

  @override
  Future<void> submitDangerSignsNewborn(Set<int> acknowledgedIndices) =>
      throw UnimplementedError('Pending backend API confirmation.');

  @override
  Future<void> submitHealthFacilityId(String facilityId) =>
      throw UnimplementedError('Pending backend API confirmation.');

  @override
  Future<void> submitSkillBirthAttendant(Map<String, dynamic> data) =>
      throw UnimplementedError('Pending backend API confirmation.');

  @override
  Future<void> submitTransportModality(Map<String, dynamic> data) =>
      throw UnimplementedError('Pending backend API confirmation.');

  @override
  Future<void> submitSavedMoneyDelivery(Map<String, dynamic> data) =>
      throw UnimplementedError('Pending backend API confirmation.');

  @override
  Future<void> submitCommunityFinancialSupport(Map<String, dynamic> data) =>
      throw UnimplementedError('Pending backend API confirmation.');

  @override
  Future<void> submitCommunityBloodDonor(Map<String, dynamic> data) =>
      throw UnimplementedError('Pending backend API confirmation.');
}

@riverpod
BpcrRepository bpcrRepository(Ref ref) => const BpcrRepositoryImpl();