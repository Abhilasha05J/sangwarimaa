import 'package:freezed_annotation/freezed_annotation.dart';

part 'mitanin_profile_model.freezed.dart';
part 'mitanin_profile_model.g.dart';

@freezed
abstract class MitaninProfileModel with _$MitaninProfileModel {
  const factory MitaninProfileModel({
    required String id,
    String? name,
    String? mobile,
    @JsonKey(name: 'worker_role') String? workerRole,
    @JsonKey(name: 'unique_id') String? uniqueId,
    String? subcentre,
    String? village,
    String? block,
    String? district,
    @JsonKey(name: 'preferred_language') @Default('hi') String preferredLanguage,
    @JsonKey(name: 'total_beneficiaries') @Default(0) int totalBeneficiaries,
    @JsonKey(name: 'pending_alerts') @Default(0) int pendingAlerts,
  }) = _MitaninProfileModel;

  factory MitaninProfileModel.fromJson(Map<String, dynamic> json) =>
      _$MitaninProfileModelFromJson(json);
}