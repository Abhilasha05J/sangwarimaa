import 'package:freezed_annotation/freezed_annotation.dart';

part 'women_register_request_model.freezed.dart';
part 'women_register_request_model.g.dart';

@freezed
abstract class WomenRegisterRequestModel with _$WomenRegisterRequestModel {
  const factory WomenRegisterRequestModel({
    required String name,
    required int age,
    @JsonKey(name: 'husband_name') String? husbandName,
    @JsonKey(name: 'husband_age') int? husbandAge,
    String? dob, // ISO yyyy-MM-dd
    String? address,
    String? village,
    String? phc,
    String? block,
    String? district,
    required String lmp, // ISO yyyy-MM-dd
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'preferred_language') @Default('hi') String preferredLanguage,
    required bool consent,
    String? latitude,
    String? longitude,
  }) = _WomenRegisterRequestModel;

  factory WomenRegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$WomenRegisterRequestModelFromJson(json);
}