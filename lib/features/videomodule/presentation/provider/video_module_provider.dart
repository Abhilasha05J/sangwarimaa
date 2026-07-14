import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/features/videomodule/data/datasource/video_module_local_datasource.dart';
import 'package:sangwari_maa/features/videomodule/data/model/video_module.dart';

part 'video_module_provider.g.dart';

@riverpod
VideoModuleDataSource videoModuleDataSource(Ref ref) {
  return VideoModuleLocalDataSource();
}

@riverpod
Future<List<VideoModule>> videoModuleList(Ref ref) {
  return ref.watch(videoModuleDataSourceProvider).getVideoModules();
}

enum VideoFilter { all, bpcr, pnc }

@riverpod
class VideoFilterNotifier extends _$VideoFilterNotifier {
  @override
  VideoFilter build() => VideoFilter.all;

  void select(VideoFilter filter) => state = filter;
}

@riverpod
Future<List<VideoModule>> filteredVideoModules(Ref ref) async {
  final all = await ref.watch(videoModuleListProvider.future);
  final filter = ref.watch(videoFilterProvider);

  return switch (filter) {
    VideoFilter.all => all,
    VideoFilter.bpcr => all.where((v) => v.category == VideoCategory.bpcr).toList(),
    VideoFilter.pnc => all.where((v) => v.category == VideoCategory.pnc).toList(),
    // TODO: Handle this case.
    Object() => throw UnimplementedError(),
    // TODO: Handle this case.
    null => throw UnimplementedError(),
  };
}