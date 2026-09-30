// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_summary_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bpcrScore)
const bpcrScoreProvider = BpcrScoreProvider._();

final class BpcrScoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<BpcrScoreModel>,
          BpcrScoreModel,
          FutureOr<BpcrScoreModel>
        >
    with $FutureModifier<BpcrScoreModel>, $FutureProvider<BpcrScoreModel> {
  const BpcrScoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bpcrScoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bpcrScoreHash();

  @$internal
  @override
  $FutureProviderElement<BpcrScoreModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BpcrScoreModel> create(Ref ref) {
    return bpcrScore(ref);
  }
}

String _$bpcrScoreHash() => r'0bd19574fd62adcd6677c725f068a45f2d713239';

@ProviderFor(bpcrEmergencyHub)
const bpcrEmergencyHubProvider = BpcrEmergencyHubProvider._();

final class BpcrEmergencyHubProvider
    extends
        $FunctionalProvider<
          AsyncValue<EmergencyHubModel>,
          EmergencyHubModel,
          FutureOr<EmergencyHubModel>
        >
    with
        $FutureModifier<EmergencyHubModel>,
        $FutureProvider<EmergencyHubModel> {
  const BpcrEmergencyHubProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bpcrEmergencyHubProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bpcrEmergencyHubHash();

  @$internal
  @override
  $FutureProviderElement<EmergencyHubModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EmergencyHubModel> create(Ref ref) {
    return bpcrEmergencyHub(ref);
  }
}

String _$bpcrEmergencyHubHash() => r'514c2bdcd33e0481a9c19229a9d0001e1d2280c4';

/// Unlike the other answer screens (draft + explicit Save), each delivery
/// bag item saves the instant she ticks it — it's a 3-item checklist, not
/// a form, and the summary card's score should reflect a tick immediately.

@ProviderFor(DeliveryBagAnswers)
const deliveryBagAnswersProvider = DeliveryBagAnswersProvider._();

/// Unlike the other answer screens (draft + explicit Save), each delivery
/// bag item saves the instant she ticks it — it's a 3-item checklist, not
/// a form, and the summary card's score should reflect a tick immediately.
final class DeliveryBagAnswersProvider
    extends $AsyncNotifierProvider<DeliveryBagAnswers, Map<String, bool>> {
  /// Unlike the other answer screens (draft + explicit Save), each delivery
  /// bag item saves the instant she ticks it — it's a 3-item checklist, not
  /// a form, and the summary card's score should reflect a tick immediately.
  const DeliveryBagAnswersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deliveryBagAnswersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deliveryBagAnswersHash();

  @$internal
  @override
  DeliveryBagAnswers create() => DeliveryBagAnswers();
}

String _$deliveryBagAnswersHash() =>
    r'80b95e2567a988a15059ef8473ce92a026655576';

/// Unlike the other answer screens (draft + explicit Save), each delivery
/// bag item saves the instant she ticks it — it's a 3-item checklist, not
/// a form, and the summary card's score should reflect a tick immediately.

abstract class _$DeliveryBagAnswers extends $AsyncNotifier<Map<String, bool>> {
  FutureOr<Map<String, bool>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<Map<String, bool>>, Map<String, bool>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Map<String, bool>>, Map<String, bool>>,
              AsyncValue<Map<String, bool>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
