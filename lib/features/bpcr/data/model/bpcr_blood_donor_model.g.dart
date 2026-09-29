// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_blood_donor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BloodDonorModel _$BloodDonorModelFromJson(Map<String, dynamic> json) =>
    _BloodDonorModel(
      id: json['id'] as String,
      donorType: json['donor_type'] as String,
      name: json['name'] as String,
      bloodGroup: json['blood_group'] as String,
      relation: json['relation'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$BloodDonorModelToJson(_BloodDonorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'donor_type': instance.donorType,
      'name': instance.name,
      'blood_group': instance.bloodGroup,
      'relation': instance.relation,
      'address': instance.address,
      'phone': instance.phone,
    };
