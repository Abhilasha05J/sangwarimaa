// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  mobile: json['mobile'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  name: json['name'] as String?,
  preferredLanguage: json['preferred_language'] as String? ?? 'hi',
  fcmToken: json['fcm_token'] as String?,
  isActive: json['is_active'] as bool? ?? true,
  lastLoginAt: json['last_login_at'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mobile': instance.mobile,
      'role': _$UserRoleEnumMap[instance.role]!,
      'name': instance.name,
      'preferred_language': instance.preferredLanguage,
      'fcm_token': instance.fcmToken,
      'is_active': instance.isActive,
      'last_login_at': instance.lastLoginAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$UserRoleEnumMap = {
  UserRole.pregnantWoman: 'pregnant_woman',
  UserRole.asha: 'asha',
  UserRole.anm: 'anm',
  UserRole.blockAdmin: 'block_admin',
  UserRole.pi: 'pi',
  UserRole.superAdmin: 'super_admin',
};
