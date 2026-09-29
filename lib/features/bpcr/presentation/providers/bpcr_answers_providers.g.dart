// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_answers_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransportAnswers)
const transportAnswersProvider = TransportAnswersProvider._();

final class TransportAnswersProvider
    extends $AsyncNotifierProvider<TransportAnswers, TransportDraft> {
  const TransportAnswersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transportAnswersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transportAnswersHash();

  @$internal
  @override
  TransportAnswers create() => TransportAnswers();
}

String _$transportAnswersHash() => r'1b3b41a813ca5beb99a5fc9244a5306d320d7d8b';

abstract class _$TransportAnswers extends $AsyncNotifier<TransportDraft> {
  FutureOr<TransportDraft> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<TransportDraft>, TransportDraft>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TransportDraft>, TransportDraft>,
              AsyncValue<TransportDraft>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SavedMoneyAnswers)
const savedMoneyAnswersProvider = SavedMoneyAnswersProvider._();

final class SavedMoneyAnswersProvider
    extends $AsyncNotifierProvider<SavedMoneyAnswers, SavedMoneyDraft> {
  const SavedMoneyAnswersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedMoneyAnswersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedMoneyAnswersHash();

  @$internal
  @override
  SavedMoneyAnswers create() => SavedMoneyAnswers();
}

String _$savedMoneyAnswersHash() => r'9b5566dcf40b1548f1359378b0dc9356ffde2bec';

abstract class _$SavedMoneyAnswers extends $AsyncNotifier<SavedMoneyDraft> {
  FutureOr<SavedMoneyDraft> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<SavedMoneyDraft>, SavedMoneyDraft>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SavedMoneyDraft>, SavedMoneyDraft>,
              AsyncValue<SavedMoneyDraft>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(CommunitySupportAnswers)
const communitySupportAnswersProvider = CommunitySupportAnswersProvider._();

final class CommunitySupportAnswersProvider
    extends
        $AsyncNotifierProvider<
          CommunitySupportAnswers,
          Map<CommunitySupportType, bool?>
        > {
  const CommunitySupportAnswersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communitySupportAnswersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communitySupportAnswersHash();

  @$internal
  @override
  CommunitySupportAnswers create() => CommunitySupportAnswers();
}

String _$communitySupportAnswersHash() =>
    r'6f7a49c1d96c687e7a46ae7ee4a060259d5c4d49';

abstract class _$CommunitySupportAnswers
    extends $AsyncNotifier<Map<CommunitySupportType, bool?>> {
  FutureOr<Map<CommunitySupportType, bool?>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<CommunitySupportType, bool?>>,
              Map<CommunitySupportType, bool?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<CommunitySupportType, bool?>>,
                Map<CommunitySupportType, bool?>
              >,
              AsyncValue<Map<CommunitySupportType, bool?>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(DeliveryFacilityAnswer)
const deliveryFacilityAnswerProvider = DeliveryFacilityAnswerProvider._();

final class DeliveryFacilityAnswerProvider
    extends $AsyncNotifierProvider<DeliveryFacilityAnswer, String?> {
  const DeliveryFacilityAnswerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deliveryFacilityAnswerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deliveryFacilityAnswerHash();

  @$internal
  @override
  DeliveryFacilityAnswer create() => DeliveryFacilityAnswer();
}

String _$deliveryFacilityAnswerHash() =>
    r'2bf9583e1858697a7620e0dd9225e06de76325ed';

abstract class _$DeliveryFacilityAnswer extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
