import 'package:freezed_annotation/freezed_annotation.dart';

part 'women_profile_model.freezed.dart';
part 'women_profile_model.g.dart';

@freezed
abstract class WomenProfileModel with _$WomenProfileModel {
  const factory WomenProfileModel({
    required WomenProfileUserModel user,
    required WomenProfileDataModel profile,
    Map<String, dynamic>? pregnancy, // untyped for now — add typed model when needed
  }) = _WomenProfileModel;

  factory WomenProfileModel.fromJson(Map<String, dynamic> json) =>
      _$WomenProfileModelFromJson(json);
}

@freezed
abstract class WomenProfileUserModel with _$WomenProfileUserModel {
  const factory WomenProfileUserModel({
    required String id,
    required String mobile,
    String? name,
    @JsonKey(name: 'preferred_language') @Default('hi') String preferredLanguage,
  }) = _WomenProfileUserModel;

  factory WomenProfileUserModel.fromJson(Map<String, dynamic> json) =>
      _$WomenProfileUserModelFromJson(json);
}

@freezed
abstract class WomenProfileDataModel with _$WomenProfileDataModel {
  const factory WomenProfileDataModel({
    required String id,
    String? name,
    int? age,
    @JsonKey(name: 'husband_name') String? husbandName,
    // NOTE: backend Beneficiary already stores these (set at registration —
    // see register_woman()), but GET /women/profile doesn't return them yet.
    // Nullable so parsing is safe either way; will populate automatically
    // once the backend adds these two keys to profile_data.
    @JsonKey(name: 'husband_age') int? husbandAge,
    @JsonKey(name: 'husband_contact_no') String? husbandContactNo,
    @JsonKey(name: 'other_family_member_name') String? otherFamilyMemberName,
    @JsonKey(name: 'other_family_member_relation') String? otherFamilyMemberRelation,
    @JsonKey(name: 'family_contact_no') String? familyContactNo,
    String? dob, // ISO date string or null
    String? village,
    String? block,
    String? district,
    String? lmp,   // ISO date string or null
    String? edd,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'risk_level') @Default('low') String riskLevel,
    @JsonKey(name: 'preferred_language') @Default('hi') String preferredLanguage,
    @JsonKey(name: 'asha_name') String? ashaName,
    @JsonKey(name: 'anm_name') String? anmName,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _WomenProfileDataModel;

  factory WomenProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$WomenProfileDataModelFromJson(json);
}