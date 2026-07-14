// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_module_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(videoModuleDataSource)
const videoModuleDataSourceProvider = VideoModuleDataSourceProvider._();

final class VideoModuleDataSourceProvider
    extends
        $FunctionalProvider<
          VideoModuleDataSource,
          VideoModuleDataSource,
          VideoModuleDataSource
        >
    with $Provider<VideoModuleDataSource> {
  const VideoModuleDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'videoModuleDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$videoModuleDataSourceHash();

  @$internal
  @override
  $ProviderElement<VideoModuleDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  VideoModuleDataSource create(Ref ref) {
    return videoModuleDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VideoModuleDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VideoModuleDataSource>(value),
    );
  }
}

String _$videoModuleDataSourceHash() =>
    r'7f0c456185a0f4fee7dc9d8e0bbc33dcf9bb69e8';

@ProviderFor(videoModuleList)
const videoModuleListProvider = VideoModuleListProvider._();

final class VideoModuleListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VideoModule>>,
          List<VideoModule>,
          FutureOr<List<VideoModule>>
        >
    with
        $FutureModifier<List<VideoModule>>,
        $FutureProvider<List<VideoModule>> {
  const VideoModuleListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'videoModuleListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$videoModuleListHash();

  @$internal
  @override
  $FutureProviderElement<List<VideoModule>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VideoModule>> create(Ref ref) {
    return videoModuleList(ref);
  }
}

String _$videoModuleListHash() => r'b34b4299fc64fba661659715bd5858648112e467';

@ProviderFor(VideoFilterNotifier)
const videoFilterProvider = VideoFilterNotifierProvider._();

final class VideoFilterNotifierProvider
    extends $NotifierProvider<VideoFilterNotifier, VideoFilter> {
  const VideoFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'videoFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$videoFilterNotifierHash();

  @$internal
  @override
  VideoFilterNotifier create() => VideoFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VideoFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VideoFilter>(value),
    );
  }
}

String _$videoFilterNotifierHash() =>
    r'ec4a2b1ddc9941f42cabfbb730e392d8ee79a734';

abstract class _$VideoFilterNotifier extends $Notifier<VideoFilter> {
  VideoFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<VideoFilter, VideoFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VideoFilter, VideoFilter>,
              VideoFilter,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(filteredVideoModules)
const filteredVideoModulesProvider = FilteredVideoModulesProvider._();

final class FilteredVideoModulesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VideoModule>>,
          List<VideoModule>,
          FutureOr<List<VideoModule>>
        >
    with
        $FutureModifier<List<VideoModule>>,
        $FutureProvider<List<VideoModule>> {
  const FilteredVideoModulesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredVideoModulesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredVideoModulesHash();

  @$internal
  @override
  $FutureProviderElement<List<VideoModule>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VideoModule>> create(Ref ref) {
    return filteredVideoModules(ref);
  }
}

String _$filteredVideoModulesHash() =>
    r'58e58399da0dc15cf3af13fed477647841169693';
