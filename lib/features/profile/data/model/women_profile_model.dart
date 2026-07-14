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