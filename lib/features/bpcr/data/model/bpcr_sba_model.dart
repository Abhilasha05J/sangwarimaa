import 'package:freezed_annotation/freezed_annotation.dart';

part 'bpcr_sba_model.freezed.dart';
part 'bpcr_sba_model.g.dart';

@freezed
abstract class SbaStaffModel with _$SbaStaffModel {
  const factory SbaStaffModel({
    required String role,
    @JsonKey(name: 'role_label') required String roleLabel,
    String? name,       // null when the post is vacant
    String? mobile,     // null when vacant, or when the number on file looked invalid
  }) = _SbaStaffModel;

  factory SbaStaffModel.fromJson(Map<String, dynamic> json) => _$SbaStaffModelFromJson(json);
}

@freezed
abstract class SbaShcGroupModel with _$SbaShcGroupModel {
  const factory SbaShcGroupModel({
    @JsonKey(name: 'shc_id') required String shcId,
    @JsonKey(name: 'shc_name') required String shcName,
    @JsonKey(name: 'is_own_village_shc') @Default(false) bool isOwnVillageShc,
    @Default([]) List<SbaStaffModel> staff,
  }) = _SbaShcGroupModel;

  factory SbaShcGroupModel.fromJson(Map<String, dynamic> json) => _$SbaShcGroupModelFromJson(json);
}

@freezed
abstract class SbaFacilityModel with _$SbaFacilityModel {
  const factory SbaFacilityModel({
    required SbaFacilityRef facility,
    @JsonKey(name: 'no_direct_sba_data') @Default(false) bool noDirectSbaData,
    @JsonKey(name: 'staff_via_child_facilities') @Default(false) bool staffViaChildFacilities,
    @Default([]) List<SbaShcGroupModel> groups,
  }) = _SbaFacilityModel;

  factory SbaFacilityModel.fromJson(Map<String, dynamic> json) => _$SbaFacilityModelFromJson(json);
}

@freezed
abstract class SbaFacilityRef with _$SbaFacilityRef {
  const factory SbaFacilityRef({
    required String id,
    required String name,
    @JsonKey(name: 'facility_type') required String facilityType,
  }) = _SbaFacilityRef;

  factory SbaFacilityRef.fromJson(Map<String, dynamic> json) => _$SbaFacilityRefFromJson(json);
}

@freezed
abstract class AshaContactModel with _$AshaContactModel {
  const factory AshaContactModel({required String name, required String mobile}) = _AshaContactModel;
  factory AshaContactModel.fromJson(Map<String, dynamic> json) => _$AshaContactModelFromJson(json);
}
