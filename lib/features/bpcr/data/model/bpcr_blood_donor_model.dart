import 'package:freezed_annotation/freezed_annotation.dart';

part 'bpcr_blood_donor_model.freezed.dart';
part 'bpcr_blood_donor_model.g.dart';

@freezed
abstract class BloodDonorModel with _$BloodDonorModel {
  const factory BloodDonorModel({
    required String id,
    @JsonKey(name: 'donor_type') required String donorType, // 'family' | 'community'
    required String name,
    @JsonKey(name: 'blood_group') required String bloodGroup,
    String? relation,
    String? address,
    required String phone,
  }) = _BloodDonorModel;

  factory BloodDonorModel.fromJson(Map<String, dynamic> json) => _$BloodDonorModelFromJson(json);
}

const kBloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];