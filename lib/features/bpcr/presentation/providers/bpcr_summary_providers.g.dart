// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_summary_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bpcrScore)
const bpcrScoreProvider = BpcrScoreProvider._();

final class BpcrScoreProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
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
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return bpcrScore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$bpcrScoreHash() => r'4982d3dc27c7390cb4dd753461f35a314e7cf11d';

@ProviderFor(bpcrCurrentProgressLabel)
const bpcrCurrentProgressLabelProvider = BpcrCurrentProgressLabelProvider._();

final class BpcrCurrentProgressLabelProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const BpcrCurrentProgressLabelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bpcrCurrentProgressLabelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bpcrCurrentProgressLabelHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return bpcrCurrentProgressLabel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$bpcrCurrentProgressLabelHash() =>
    r'4a82e2b1d4c36541f25a11ab1baeeff9f30d5b55';

@ProviderFor(bpcrDueDateLabel)
const bpcrDueDateLabelProvider = BpcrDueDateLabelProvider._();

final class BpcrDueDateLabelProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const BpcrDueDateLabelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bpcrDueDateLabelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bpcrDueDateLabelHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return bpcrDueDateLabel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$bpcrDueDateLabelHash() => r'19aa097feaca0297382b97deaf393e45402c483d';

@ProviderFor(journeyMilestones)
const journeyMilestonesProvider = JourneyMilestonesProvider._();

final class JourneyMilestonesProvider
    extends
        $FunctionalProvider<
          List<JourneyMilestone>,
          List<JourneyMilestone>,
          List<JourneyMilestone>
        >
    with $Provider<List<JourneyMilestone>> {
  const JourneyMilestonesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'journeyMilestonesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$journeyMilestonesHash();

  @$internal
  @override
  $ProviderElement<List<JourneyMilestone>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<JourneyMilestone> create(Ref ref) {
    return journeyMilestones(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<JourneyMilestone> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<JourneyMilestone>>(value),
    );
  }
}

String _$journeyMilestonesHash() => r'6789417462cb7697479e07cbe71607b340608c68';

@ProviderFor(domainChecklist)
const domainChecklistProvider = DomainChecklistProvider._();

final class DomainChecklistProvider
    extends
        $FunctionalProvider<
          List<DomainChecklistItem>,
          List<DomainChecklistItem>,
          List<DomainChecklistItem>
        >
    with $Provider<List<DomainChecklistItem>> {
  const DomainChecklistProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'domainChecklistProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$domainChecklistHash();

  @$internal
  @override
  $ProviderElement<List<DomainChecklistItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<DomainChecklistItem> create(Ref ref) {
    return domainChecklist(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DomainChecklistItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DomainChecklistItem>>(value),
    );
  }
}

String _$domainChecklistHash() => r'ecd297ba81c88cf9fde5b18c2ad6f428621c56d5';

@ProviderFor(emergencyContacts)
const emergencyContactsProvider = EmergencyContactsProvider._();

final class EmergencyContactsProvider
    extends
        $FunctionalProvider<
          List<EmergencyContact>,
          List<EmergencyContact>,
          List<EmergencyContact>
        >
    with $Provider<List<EmergencyContact>> {
  const EmergencyContactsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'emergencyContactsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$emergencyContactsHash();

  @$internal
  @override
  $ProviderElement<List<EmergencyContact>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<EmergencyContact> create(Ref ref) {
    return emergencyContacts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<EmergencyContact> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<EmergencyContact>>(value),
    );
  }
}

String _$emergencyContactsHash() => r'27df18610da6aae8a8b6cf77156ecf7b7fa689cf';
