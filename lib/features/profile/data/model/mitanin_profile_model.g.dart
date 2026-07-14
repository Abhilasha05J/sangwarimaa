// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mitanin_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MitaninProfileModel _$MitaninProfileModelFromJson(Map<String, dynamic> json) =>
    _MitaninProfileModel(
      id: json['id'] as String,
      name: json['name'] as String?,
      mobile: json['mobile'] as String?,
      workerRole: json['worker_role'] as String?,
      uniqueId: json['unique_id'] as String?,
      subcentre: json['subcentre'] as String?,
      village: json['village'] as String?,
      block: json['block'] as String?,
      district: json['district'] as String?,
      preferredLanguage: json['preferred_language'] as String? ?? 'hi',
      totalBeneficiaries: (json['total_beneficiaries'] as num?)?.toInt() ?? 0,
      pendingAlerts: (json['pending_alerts'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MitaninProfileModelToJson(
  _MitaninProfileModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'mobile': instance.mobile,
  'worker_role': instance.workerRole,
  'unique_id': instance.uniqueId,
  'subcentre': instance.subcentre,
  'village': instance.village,
  'block': instance.block,
  'district': instance.district,
  'preferred_language': instance.preferredLanguage,
  'total_beneficiaries': instance.totalBeneficiaries,
  'pending_alerts': instance.pendingAlerts,
};
