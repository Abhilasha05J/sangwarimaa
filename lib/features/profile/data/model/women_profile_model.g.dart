// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'women_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WomenProfileModel _$WomenProfileModelFromJson(Map<String, dynamic> json) =>
    _WomenProfileModel(
      user: WomenProfileUserModel.fromJson(
        json['user'] as Map<String, dynamic>,
      ),
      profile: WomenProfileDataModel.fromJson(
        json['profile'] as Map<String, dynamic>,
      ),
      pregnancy: json['pregnancy'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$WomenProfileModelToJson(_WomenProfileModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'profile': instance.profile,
      'pregnancy': instance.pregnancy,
    };

_WomenProfileUserModel _$WomenProfileUserModelFromJson(
  Map<String, dynamic> json,
) => _WomenProfileUserModel(
  id: json['id'] as String,
  mobile: json['mobile'] as String,
  name: json['name'] as String?,
  preferredLanguage: json['preferred_language'] as String? ?? 'hi',
);

Map<String, dynamic> _$WomenProfileUserModelToJson(
  _WomenProfileUserModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'mobile': instance.mobile,
  'name': instance.name,
  'preferred_language': instance.preferredLanguage,
};

_WomenProfileDataModel _$WomenProfileDataModelFromJson(
  Map<String, dynamic> json,
) => _WomenProfileDataModel(
  id: json['id'] as String,
  name: json['name'] as String?,
  age: (json['age'] as num?)?.toInt(),
  husbandName: json['husband_name'] as String?,
  village: json['village'] as String?,
  block: json['block'] as String?,
  district: json['district'] as String?,
  lmp: json['lmp'] as String?,
  edd: json['edd'] as String?,
  bloodGroup: json['blood_group'] as String?,
  riskLevel: json['risk_level'] as String? ?? 'low',
  preferredLanguage: json['preferred_language'] as String? ?? 'hi',
  ashaName: json['asha_name'] as String?,
  anmName: json['anm_name'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$WomenProfileDataModelToJson(
  _WomenProfileDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'age': instance.age,
  'husband_name': instance.husbandName,
  'village': instance.village,
  'block': instance.block,
  'district': instance.district,
  'lmp': instance.lmp,
  'edd': instance.edd,
  'blood_group': instance.bloodGroup,
  'risk_level': instance.riskLevel,
  'preferred_language': instance.preferredLanguage,
  'asha_name': instance.ashaName,
  'anm_name': instance.anmName,
  'created_at': instance.createdAt,
};
