// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_danger_signs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BpcrDangerSignsSelection)
const bpcrDangerSignsSelectionProvider = BpcrDangerSignsSelectionFamily._();

final class BpcrDangerSignsSelectionProvider
    extends $NotifierProvider<BpcrDangerSignsSelection, Set<int>> {
  const BpcrDangerSignsSelectionProvider._({
    required BpcrDangerSignsSelectionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bpcrDangerSignsSelectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bpcrDangerSignsSelectionHash();

  @override
  String toString() {
    return r'bpcrDangerSignsSelectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BpcrDangerSignsSelection create() => BpcrDangerSignsSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BpcrDangerSignsSelectionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bpcrDangerSignsSelectionHash() =>
    r'3fd5908514bf5feac44a21ce02a0614933b7efe7';

final class BpcrDangerSignsSelectionFamily extends $Family
    with
        $ClassFamilyOverride<
          BpcrDangerSignsSelection,
          Set<int>,
          Set<int>,
          Set<int>,
          String
        > {
  const BpcrDangerSignsSelectionFamily._()
    : super(
        retry: null,
        name: r'bpcrDangerSignsSelectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BpcrDangerSignsSelectionProvider call(String componentKey) =>
      BpcrDangerSignsSelectionProvider._(argument: componentKey, from: this);

  @override
  String toString() => r'bpcrDangerSignsSelectionProvider';
}

abstract class _$BpcrDangerSignsSelection extends $Notifier<Set<int>> {
  late final _$args = ref.$arg as String;
  String get componentKey => _$args;

  Set<int> build(String componentKey);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<Set<int>, Set<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<int>, Set<int>>,
              Set<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
