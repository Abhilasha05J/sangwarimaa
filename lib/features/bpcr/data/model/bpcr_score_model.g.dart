// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BpcrDomainModel _$BpcrDomainModelFromJson(Map<String, dynamic> json) =>
    _BpcrDomainModel(
      key: json['key'] as String,
      maxPoints: (json['max_points'] as num).toInt(),
      earned: (json['earned'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$BpcrDomainModelToJson(_BpcrDomainModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'max_points': instance.maxPoints,
      'earned': instance.earned,
      'status': instance.status,
    };

_BpcrScoreModel _$BpcrScoreModelFromJson(Map<String, dynamic> json) =>
    _BpcrScoreModel(
      totalScore: (json['total_score'] as num).toInt(),
      maxScore: (json['max_score'] as num).toInt(),
      maxReachableNow: (json['max_reachable_now'] as num).toInt(),
      band: json['band'] as String,
      messageEn: json['message_en'] as String,
      domains:
          (json['domains'] as List<dynamic>)
              .map((e) => BpcrDomainModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$BpcrScoreModelToJson(_BpcrScoreModel instance) =>
    <String, dynamic>{
      'total_score': instance.totalScore,
      'max_score': instance.maxScore,
      'max_reachable_now': instance.maxReachableNow,
      'band': instance.band,
      'message_en': instance.messageEn,
      'domains': instance.domains,
    };
