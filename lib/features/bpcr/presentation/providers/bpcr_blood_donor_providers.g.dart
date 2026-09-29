// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpcr_blood_donor_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BpcrBloodDonors)
const bpcrBloodDonorsProvider = BpcrBloodDonorsProvider._();

final class BpcrBloodDonorsProvider
    extends $AsyncNotifierProvider<BpcrBloodDonors, BloodDonorListResponse> {
  const BpcrBloodDonorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bpcrBloodDonorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bpcrBloodDonorsHash();

  @$internal
  @override
  BpcrBloodDonors create() => BpcrBloodDonors();
}

String _$bpcrBloodDonorsHash() => r'4ef39c73521004f8197043e17f64376896e6fd7f';

abstract class _$BpcrBloodDonors
    extends $AsyncNotifier<BloodDonorListResponse> {
  FutureOr<BloodDonorListResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<BloodDonorListResponse>, BloodDonorListResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<BloodDonorListResponse>,
                BloodDonorListResponse
              >,
              AsyncValue<BloodDonorListResponse>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
