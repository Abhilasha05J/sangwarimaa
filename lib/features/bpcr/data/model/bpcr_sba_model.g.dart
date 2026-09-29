// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_sba_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SbaStaffModel _$SbaStaffModelFromJson(Map<String, dynamic> json) =>
    _SbaStaffModel(
      role: json['role'] as String,
      roleLabel: json['role_label'] as String,
      name: json['name'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$SbaStaffModelToJson(_SbaStaffModel instance) =>
    <String, dynamic>{
      'role': instance.role,
      'role_label': instance.roleLabel,
      'name': instance.name,
      'mobile': instance.mobile,
    };

_SbaShcGroupModel _$SbaShcGroupModelFromJson(Map<String, dynamic> json) =>
    _SbaShcGroupModel(
      shcId: json['shc_id'] as String,
      shcName: json['shc_name'] as String,
      isOwnVillageShc: json['is_own_village_shc'] as bool? ?? false,
      staff:
          (json['staff'] as List<dynamic>?)
              ?.map((e) => SbaStaffModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SbaShcGroupModelToJson(_SbaShcGroupModel instance) =>
    <String, dynamic>{
      'shc_id': instance.shcId,
      'shc_name': instance.shcName,
      'is_own_village_shc': instance.isOwnVillageShc,
      'staff': instance.staff,
    };

_SbaFacilityModel _$SbaFacilityModelFromJson(
  Map<String, dynamic> json,
) => _SbaFacilityModel(
  facility: SbaFacilityRef.fromJson(json['facility'] as Map<String, dynamic>),
  noDirectSbaData: json['no_direct_sba_data'] as bool? ?? false,
  staffViaChildFacilities: json['staff_via_child_facilities'] as bool? ?? false,
  groups:
      (json['groups'] as List<dynamic>?)
          ?.map((e) => SbaShcGroupModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$SbaFacilityModelToJson(_SbaFacilityModel instance) =>
    <String, dynamic>{
      'facility': instance.facility,
      'no_direct_sba_data': instance.noDirectSbaData,
      'staff_via_child_facilities': instance.staffViaChildFacilities,
      'groups': instance.groups,
    };

_SbaFacilityRef _$SbaFacilityRefFromJson(Map<String, dynamic> json) =>
    _SbaFacilityRef(
      id: json['id'] as String,
      name: json['name'] as String,
      facilityType: json['facility_type'] as String,
    );

Map<String, dynamic> _$SbaFacilityRefToJson(_SbaFacilityRef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'facility_type': instance.facilityType,
    };

_AshaContactModel _$AshaContactModelFromJson(Map<String, dynamic> json) =>
    _AshaContactModel(
      name: json['name'] as String,
      mobile: json['mobile'] as String,
    );

Map<String, dynamic> _$AshaContactModelToJson(_AshaContactModel instance) =>
    <String, dynamic>{'name': instance.name, 'mobile': instance.mobile};
