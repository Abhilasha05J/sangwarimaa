// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoModule _$VideoModuleFromJson(Map<String, dynamic> json) => _VideoModule(
  id: json['id'] as String,
  category: $enumDecode(_$VideoCategoryEnumMap, json['category']),
  titleEn: json['titleEn'] as String,
  titleHi: json['titleHi'] as String,
  videoUrl: json['videoUrl'] as String,
  thumbnailUrl: json['thumbnailUrl'] as String,
);

Map<String, dynamic> _$VideoModuleToJson(_VideoModule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': _$VideoCategoryEnumMap[instance.category]!,
      'titleEn': instance.titleEn,
      'titleHi': instance.titleHi,
      'videoUrl': instance.videoUrl,
      'thumbnailUrl': instance.thumbnailUrl,
    };

const _$VideoCategoryEnumMap = {
  VideoCategory.bpcr: 'bpcr',
  VideoCategory.pnc: 'pnc',
};
