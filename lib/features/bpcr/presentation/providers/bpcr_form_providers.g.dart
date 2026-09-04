// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_form_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(nearbyFacilities)
const nearbyFacilitiesProvider = NearbyFacilitiesProvider._();

final class NearbyFacilitiesProvider
    extends
        $FunctionalProvider<
          List<FacilityData>,
          List<FacilityData>,
          List<FacilityData>
        >
    with $Provider<List<FacilityData>> {
  const NearbyFacilitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nearbyFacilitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nearbyFacilitiesHash();

  @$internal
  @override
  $ProviderElement<List<FacilityData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<FacilityData> create(Ref ref) {
    return nearbyFacilities(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<FacilityData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<FacilityData>>(value),
    );
  }
}

String _$nearbyFacilitiesHash() => r'0e26e7652bce43d2cca969112e6ef6986a29e912';

@ProviderFor(skilledBirthAttendants)
const skilledBirthAttendantsProvider = SkilledBirthAttendantsProvider._();

final class SkilledBirthAttendantsProvider
    extends
        $FunctionalProvider<
          List<ContactPersonData>,
          List<ContactPersonData>,
          List<ContactPersonData>
        >
    with $Provider<List<ContactPersonData>> {
  const SkilledBirthAttendantsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'skilledBirthAttendantsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$skilledBirthAttendantsHash();

  @$internal
  @override
  $ProviderElement<List<ContactPersonData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ContactPersonData> create(Ref ref) {
    return skilledBirthAttendants(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ContactPersonData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ContactPersonData>>(value),
    );
  }
}

String _$skilledBirthAttendantsHash() =>
    r'766f34177e5d97a8b4c9e9c14f9502a9e37531cc';

@ProviderFor(ashaContact)
const ashaContactProvider = AshaContactProvider._();

final class AshaContactProvider
    extends
        $FunctionalProvider<
          ContactPersonData,
          ContactPersonData,
          ContactPersonData
        >
    with $Provider<ContactPersonData> {
  const AshaContactProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ashaContactProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ashaContactHash();

  @$internal
  @override
  $ProviderElement<ContactPersonData> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ContactPersonData create(Ref ref) {
    return ashaContact(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContactPersonData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContactPersonData>(value),
    );
  }
}

String _$ashaContactHash() => r'b472166e47bdc9e763e5e8886a7e40c89870ae7d';

@ProviderFor(tbaContacts)
const tbaContactsProvider = TbaContactsProvider._();

final class TbaContactsProvider
    extends
        $FunctionalProvider<
          List<ContactPersonData>,
          List<ContactPersonData>,
          List<ContactPersonData>
        >
    with $Provider<List<ContactPersonData>> {
  const TbaContactsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tbaContactsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tbaContactsHash();

  @$internal
  @override
  $ProviderElement<List<ContactPersonData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ContactPersonData> create(Ref ref) {
    return tbaContacts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ContactPersonData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ContactPersonData>>(value),
    );
  }
}

String _$tbaContactsHash() => r'd6b5f819c068d6ded7d26c5f6e2b6d768252eb6a';

@ProviderFor(CommunitySupportAnswers)
const communitySupportAnswersProvider = CommunitySupportAnswersProvider._();

final class CommunitySupportAnswersProvider
    extends
        $NotifierProvider<
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<CommunitySupportType, bool?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<CommunitySupportType, bool?>>(
        value,
      ),
    );
  }
}

String _$communitySupportAnswersHash() =>
    r'366487ee4f25a23b8250c2bff58fd4f1321830b7';

abstract class _$CommunitySupportAnswers
    extends $Notifier<Map<CommunitySupportType, bool?>> {
  Map<CommunitySupportType, bool?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Map<CommunitySupportType, bool?>,
              Map<CommunitySupportType, bool?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<CommunitySupportType, bool?>,
                Map<CommunitySupportType, bool?>
              >,
              Map<CommunitySupportType, bool?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SelfSavingAnswer)
const selfSavingAnswerProvider = SelfSavingAnswerProvider._();

final class SelfSavingAnswerProvider
    extends $NotifierProvider<SelfSavingAnswer, bool?> {
  const SelfSavingAnswerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selfSavingAnswerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selfSavingAnswerHash();

  @$internal
  @override
  SelfSavingAnswer create() => SelfSavingAnswer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool?>(value),
    );
  }
}

String _$selfSavingAnswerHash() => r'677f0e5d70a6ec9958361c6fb38c116fbbf48e25';

abstract class _$SelfSavingAnswer extends $Notifier<bool?> {
  bool? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool?, bool?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool?, bool?>,
              bool?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(HusbandSavingSelected)
const husbandSavingSelectedProvider = HusbandSavingSelectedProvider._();

final class HusbandSavingSelectedProvider
    extends $NotifierProvider<HusbandSavingSelected, bool> {
  const HusbandSavingSelectedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'husbandSavingSelectedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$husbandSavingSelectedHash();

  @$internal
  @override
  HusbandSavingSelected create() => HusbandSavingSelected();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$husbandSavingSelectedHash() =>
    r'9f267a0e40250669b9d29c4df48952c6f0427b49';

abstract class _$HusbandSavingSelected extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(MotherInLawSavingSelected)
const motherInLawSavingSelectedProvider = MotherInLawSavingSelectedProvider._();

final class MotherInLawSavingSelectedProvider
    extends $NotifierProvider<MotherInLawSavingSelected, bool> {
  const MotherInLawSavingSelectedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'motherInLawSavingSelectedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$motherInLawSavingSelectedHash();

  @$internal
  @override
  MotherInLawSavingSelected create() => MotherInLawSavingSelected();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$motherInLawSavingSelectedHash() =>
    r'57fdcf74a946de45f79efbb32da59d2827980188';

abstract class _$MotherInLawSavingSelected extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(CommunityDonorConfirmed)
const communityDonorConfirmedProvider = CommunityDonorConfirmedProvider._();

final class CommunityDonorConfirmedProvider
    extends $NotifierProvider<CommunityDonorConfirmed, bool?> {
  const CommunityDonorConfirmedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityDonorConfirmedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityDonorConfirmedHash();

  @$internal
  @override
  CommunityDonorConfirmed create() => CommunityDonorConfirmed();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool?>(value),
    );
  }
}

String _$communityDonorConfirmedHash() =>
    r'baa3aa6e5d9bdde3869834a097992998a5d55e4a';

abstract class _$CommunityDonorConfirmed extends $Notifier<bool?> {
  bool? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool?, bool?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool?, bool?>,
              bool?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(DeliveryPlaceSelection)
const deliveryPlaceSelectionProvider = DeliveryPlaceSelectionProvider._();

final class DeliveryPlaceSelectionProvider
    extends $NotifierProvider<DeliveryPlaceSelection, DeliveryPlaceChoice?> {
  const DeliveryPlaceSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deliveryPlaceSelectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deliveryPlaceSelectionHash();

  @$internal
  @override
  DeliveryPlaceSelection create() => DeliveryPlaceSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeliveryPlaceChoice? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeliveryPlaceChoice?>(value),
    );
  }
}

String _$deliveryPlaceSelectionHash() =>
    r'4cc85161a1df833a7ea81021768b59fb7611295a';

abstract class _$DeliveryPlaceSelection
    extends $Notifier<DeliveryPlaceChoice?> {
  DeliveryPlaceChoice? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DeliveryPlaceChoice?, DeliveryPlaceChoice?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DeliveryPlaceChoice?, DeliveryPlaceChoice?>,
              DeliveryPlaceChoice?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(TransportOptionSelection)
const transportOptionSelectionProvider = TransportOptionSelectionProvider._();

final class TransportOptionSelectionProvider
    extends
        $NotifierProvider<TransportOptionSelection, TransportOptionChoice?> {
  const TransportOptionSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transportOptionSelectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transportOptionSelectionHash();

  @$internal
  @override
  TransportOptionSelection create() => TransportOptionSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransportOptionChoice? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransportOptionChoice?>(value),
    );
  }
}

String _$transportOptionSelectionHash() =>
    r'ccb33ab7b74cc2fe3afac5ab4f85ecdb6e57f30c';

abstract class _$TransportOptionSelection
    extends $Notifier<TransportOptionChoice?> {
  TransportOptionChoice? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<TransportOptionChoice?, TransportOptionChoice?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TransportOptionChoice?, TransportOptionChoice?>,
              TransportOptionChoice?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AmbulanceSharedWithFamily)
const ambulanceSharedWithFamilyProvider = AmbulanceSharedWithFamilyProvider._();

final class AmbulanceSharedWithFamilyProvider
    extends $NotifierProvider<AmbulanceSharedWithFamily, bool?> {
  const AmbulanceSharedWithFamilyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ambulanceSharedWithFamilyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ambulanceSharedWithFamilyHash();

  @$internal
  @override
  AmbulanceSharedWithFamily create() => AmbulanceSharedWithFamily();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool?>(value),
    );
  }
}

String _$ambulanceSharedWithFamilyHash() =>
    r'4795720099b07592f27f3f281afb0c52d1189293';

abstract class _$AmbulanceSharedWithFamily extends $Notifier<bool?> {
  bool? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool?, bool?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool?, bool?>,
              bool?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(OwnVehicleSelection)
const ownVehicleSelectionProvider = OwnVehicleSelectionProvider._();

final class OwnVehicleSelectionProvider
    extends $NotifierProvider<OwnVehicleSelection, OwnVehicleType?> {
  const OwnVehicleSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ownVehicleSelectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ownVehicleSelectionHash();

  @$internal
  @override
  OwnVehicleSelection create() => OwnVehicleSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OwnVehicleType? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OwnVehicleType?>(value),
    );
  }
}

String _$ownVehicleSelectionHash() =>
    r'c3172809bb4cb8a29330b2903f946093215aa88e';

abstract class _$OwnVehicleSelection extends $Notifier<OwnVehicleType?> {
  OwnVehicleType? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<OwnVehicleType?, OwnVehicleType?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OwnVehicleType?, OwnVehicleType?>,
              OwnVehicleType?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(BirthCompanionSelection)
const birthCompanionSelectionProvider = BirthCompanionSelectionProvider._();

final class BirthCompanionSelectionProvider
    extends $NotifierProvider<BirthCompanionSelection, BirthCompanionChoice?> {
  const BirthCompanionSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'birthCompanionSelectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$birthCompanionSelectionHash();

  @$internal
  @override
  BirthCompanionSelection create() => BirthCompanionSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BirthCompanionChoice? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BirthCompanionChoice?>(value),
    );
  }
}

String _$birthCompanionSelectionHash() =>
    r'ce7e1f2e688297085070d7161ea064bab9d9a6a7';

abstract class _$BirthCompanionSelection
    extends $Notifier<BirthCompanionChoice?> {
  BirthCompanionChoice? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BirthCompanionChoice?, BirthCompanionChoice?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BirthCompanionChoice?, BirthCompanionChoice?>,
              BirthCompanionChoice?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
