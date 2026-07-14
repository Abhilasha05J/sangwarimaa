import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_module.freezed.dart';
part 'video_module.g.dart';

enum VideoCategory { bpcr, pnc }

@freezed
abstract class VideoModule with _$VideoModule {
  const factory VideoModule({
    required String id,
    required VideoCategory category,
    required String titleEn,
    required String titleHi,
    required String videoUrl,
    required String thumbnailUrl,
  }) = _VideoModule;

  factory VideoModule.fromJson(Map<String, dynamic> json) =>
      _$VideoModuleFromJson(json);
}