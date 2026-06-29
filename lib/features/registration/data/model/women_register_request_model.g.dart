// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'women_register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WomenRegisterRequestModel _$WomenRegisterRequestModelFromJson(
  Map<String, dynamic> json,
) => _WomenRegisterRequestModel(
  name: json['name'] as String,
  age: (json['age'] as num).toInt(),
  husbandName: json['husband_name'] as String?,
  husbandAge: (json['husband_age'] as num?)?.toInt(),
  dob: json['dob'] as String?,
  address: json['address'] as String?,
  village: json['village'] as String?,
  phc: json['phc'] as String?,
  block: json['block'] as String?,
  district: json['district'] as String?,
  lmp: json['lmp'] as String,
  bloodGroup: json['blood_group'] as String?,
  preferredLanguage: json['preferred_language'] as String? ?? 'hi',
  consent: json['consent'] as bool,
  latitude: json['latitude'] as String?,
  longitude: json['longitude'] as String?,
);

Map<String, dynamic> _$WomenRegisterRequestModelToJson(
  _WomenRegisterRequestModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'age': instance.age,
  'husband_name': instance.husbandName,
  'husband_age': instance.husbandAge,
  'dob': instance.dob,
  'address': instance.address,
  'village': instance.village,
  'phc': instance.phc,
  'block': instance.block,
  'district': instance.district,
  'lmp': instance.lmp,
  'blood_group': instance.bloodGroup,
  'preferred_language': instance.preferredLanguage,
  'consent': instance.consent,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
