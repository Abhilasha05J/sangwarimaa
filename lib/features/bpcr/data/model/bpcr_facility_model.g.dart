// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_facility_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BpcrFacilityModel _$BpcrFacilityModelFromJson(Map<String, dynamic> json) =>
    _BpcrFacilityModel(
      id: json['id'] as String,
      name: json['name'] as String,
      facilityType: json['facility_type'] as String,
      subDistrict: json['sub_district'] as String?,
      is24x7: json['is_24x7'] as bool? ?? false,
      isFru: json['is_fru'] as bool? ?? false,
      category: json['category'] as String?,
      isSelected: json['is_selected'] as bool? ?? false,
      inCatchment: json['in_catchment'] as bool? ?? false,
    );

Map<String, dynamic> _$BpcrFacilityModelToJson(_BpcrFacilityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'facility_type': instance.facilityType,
      'sub_district': instance.subDistrict,
      'is_24x7': instance.is24x7,
      'is_fru': instance.isFru,
      'category': instance.category,
      'is_selected': instance.isSelected,
      'in_catchment': instance.inCatchment,
    };
