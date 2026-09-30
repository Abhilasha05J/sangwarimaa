import 'package:freezed_annotation/freezed_annotation.dart';

part 'bpcr_score_model.freezed.dart';
part 'bpcr_score_model.g.dart';

@freezed
abstract class BpcrDomainModel with _$BpcrDomainModel {
  const factory BpcrDomainModel({
    required String key,
    @JsonKey(name: 'max_points') required int maxPoints,
    required int earned,
    required String status, // 'completed' | 'pending' | 'not_tracked_yet'
  }) = _BpcrDomainModel;

  factory BpcrDomainModel.fromJson(Map<String, dynamic> json) => _$BpcrDomainModelFromJson(json);
}

@freezed
abstract class BpcrScoreModel with _$BpcrScoreModel {
  const factory BpcrScoreModel({
    @JsonKey(name: 'total_score') required int totalScore,
    @JsonKey(name: 'max_score') required int maxScore,
    @JsonKey(name: 'max_reachable_now') required int maxReachableNow,
    required String band, // 'excellent'|'good'|'moderate'|'poor'|'high_risk'
    @JsonKey(name: 'message_en') required String messageEn,
    required List<BpcrDomainModel> domains,
  }) = _BpcrScoreModel;

  factory BpcrScoreModel.fromJson(Map<String, dynamic> json) => _$BpcrScoreModelFromJson(json);
}

// ── Emergency hub — plain classes, not freezed ──────────────────────────
// The backend nests each contact under a different shape (husband.phone,
// family_contact.phone, asha.mobile, blood_donor.phone) and each is
// nullable independently, so this is hand-parsed rather than fought
// through json_serializable's generated code.

class EmergencyContact {
  final String? name;
  final String? relation;
  final String phone;
  const EmergencyContact({this.name, this.relation, required this.phone});
}

class EmergencyHubModel {
  final List<String> ambulanceNumbers;
  final EmergencyContact? husband;
  final EmergencyContact? familyContact;
  final EmergencyContact? asha;
  final EmergencyContact? bloodDonor;

  const EmergencyHubModel({
    required this.ambulanceNumbers,
    this.husband,
    this.familyContact,
    this.asha,
    this.bloodDonor,
  });

  factory EmergencyHubModel.fromJson(Map<String, dynamic> j) => EmergencyHubModel(
    ambulanceNumbers: List<String>.from(j['ambulance_numbers'] ?? const []),
    husband: j['husband'] == null ? null : EmergencyContact(
      name: j['husband']['name'], phone: j['husband']['phone'] ?? ''),
    familyContact: j['family_contact'] == null ? null : EmergencyContact(
      name: j['family_contact']['name'], relation: j['family_contact']['relation'],
      phone: j['family_contact']['phone'] ?? ''),
    asha: j['asha'] == null ? null : EmergencyContact(
      name: j['asha']['name'], phone: j['asha']['mobile'] ?? ''),
    bloodDonor: j['blood_donor'] == null ? null : EmergencyContact(
      name: j['blood_donor']['name'], phone: j['blood_donor']['phone'] ?? ''),
  );
}
