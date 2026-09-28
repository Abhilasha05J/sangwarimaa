// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'village_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VillageModel _$VillageModelFromJson(Map<String, dynamic> json) =>
    _VillageModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String?,
      block: json['block'] as String,
      shcName: json['shc_name'] as String?,
      hasFacilityData: json['has_facility_data'] as bool? ?? false,
    );

Map<String, dynamic> _$VillageModelToJson(_VillageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'block': instance.block,
      'shc_name': instance.shcName,
      'has_facility_data': instance.hasFacilityData,
    };
