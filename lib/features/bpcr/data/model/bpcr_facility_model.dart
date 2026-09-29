import 'package:freezed_annotation/freezed_annotation.dart';

part 'bpcr_facility_model.freezed.dart';
part 'bpcr_facility_model.g.dart';

@freezed
abstract class BpcrFacilityModel with _$BpcrFacilityModel {
  const factory BpcrFacilityModel({
    required String id,
    required String name,
    @JsonKey(name: 'facility_type') required String facilityType, // CHC|PHC|SHC|SDH
    @JsonKey(name: 'sub_district') String? subDistrict,
    @JsonKey(name: 'is_24x7') @Default(false) bool is24x7,
    @JsonKey(name: 'is_fru') @Default(false) bool isFru,
    String? category,
    @JsonKey(name: 'is_selected') @Default(false) bool isSelected,
    @JsonKey(name: 'in_catchment') @Default(false) bool inCatchment,
  }) = _BpcrFacilityModel;

  factory BpcrFacilityModel.fromJson(Map<String, dynamic> json) =>
      _$BpcrFacilityModelFromJson(json);
}
