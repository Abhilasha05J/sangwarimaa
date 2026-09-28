import 'package:freezed_annotation/freezed_annotation.dart';

part 'village_model.freezed.dart';
part 'village_model.g.dart';

/// One row returned by GET /villages — used for the registration dropdown.
@freezed
abstract class VillageModel with _$VillageModel {
  const factory VillageModel({
    required String id,
    required String name,
    String? code,
    required String block,
    @JsonKey(name: 'shc_name') String? shcName,
    @JsonKey(name: 'has_facility_data') @Default(false) bool hasFacilityData,
  }) = _VillageModel;

  factory VillageModel.fromJson(Map<String, dynamic> json) =>
      _$VillageModelFromJson(json);
}
