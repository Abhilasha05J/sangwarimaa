// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anc_services_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AncServicesController)
const ancServicesControllerProvider = AncServicesControllerProvider._();

final class AncServicesControllerProvider
    extends $AsyncNotifierProvider<AncServicesController, AncServicesModel> {
  const AncServicesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ancServicesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ancServicesControllerHash();

  @$internal
  @override
  AncServicesController create() => AncServicesController();
}

String _$ancServicesControllerHash() =>
    r'a92875cc6e9a196888b3178199e1000b3b65b07c';

abstract class _$AncServicesController
    extends $AsyncNotifier<AncServicesModel> {
  FutureOr<AncServicesModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<AncServicesModel>, AncServicesModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AncServicesModel>, AncServicesModel>,
              AsyncValue<AncServicesModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
