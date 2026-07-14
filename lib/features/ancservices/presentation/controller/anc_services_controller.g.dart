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
    r'39fb934ea477fda4ea5650e0c5ebacc0d8620f25';

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
