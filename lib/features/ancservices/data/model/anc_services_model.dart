import 'package:freezed_annotation/freezed_annotation.dart';

part 'anc_services_model.freezed.dart';
part 'anc_services_model.g.dart';

@freezed
abstract class ChecklistItemModel with _$ChecklistItemModel {
  const factory ChecklistItemModel({
    required String key,
    @JsonKey(name: 'label_hi') String? labelHi,
    @JsonKey(name: 'label_en') String? labelEn,
    @Default(false) bool checked,
  }) = _ChecklistItemModel;

  factory ChecklistItemModel.fromJson(Map<String, dynamic> json) =>
      _$ChecklistItemModelFromJson(json);
}

@freezed
abstract class AncVisitTimelineItem with _$AncVisitTimelineItem {
  const factory AncVisitTimelineItem({
    @JsonKey(name: 'visit_number') required int visitNumber,
    @JsonKey(name: 'title_hi') String? titleHi,
    @JsonKey(name: 'title_en') String? titleEn,
    @JsonKey(name: 'week_range') required String weekRange,
    @Default([]) List<ChecklistItemModel> items,
    @JsonKey(name: 'tests_completed') @Default(0) int testsCompleted,
    @JsonKey(name: 'tests_total') @Default(0) int testsTotal,
    @Default('due') String status, // 'completed' | 'due'
    @JsonKey(name: 'visit_date') String? visitDate,
  }) = _AncVisitTimelineItem;

  factory AncVisitTimelineItem.fromJson(Map<String, dynamic> json) =>
      _$AncVisitTimelineItemFromJson(json);
}

@freezed
abstract class VisitProgressItem with _$VisitProgressItem {
  const factory VisitProgressItem({
    @JsonKey(name: 'visit_number') required int visitNumber,
    @JsonKey(name: 'week_range') required String weekRange,
    @JsonKey(name: 'is_completed') @Default(false) bool isCompleted,
  }) = _VisitProgressItem;

  factory VisitProgressItem.fromJson(Map<String, dynamic> json) =>
      _$VisitProgressItemFromJson(json);
}

@freezed
abstract class PregnancyRegistrationModel with _$PregnancyRegistrationModel {
  const factory PregnancyRegistrationModel({
    @JsonKey(name: 'is_registered') @Default(false) bool isRegistered,
    @JsonKey(name: 'registered_date') String? registeredDate,
    @JsonKey(name: 'rch_id_generated') @Default(false) bool rchIdGenerated,
    @JsonKey(name: 'rch_id') String? rchId,
    @JsonKey(name: 'mcp_card_received') @Default(false) bool mcpCardReceived,
    @JsonKey(name: 'asha_assigned') @Default(false) bool ashaAssigned,
  }) = _PregnancyRegistrationModel;

  factory PregnancyRegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$PregnancyRegistrationModelFromJson(json);
}

@freezed
abstract class MaternalNutritionModel with _$MaternalNutritionModel {
  const factory MaternalNutritionModel({
    @JsonKey(name: 'nutrition_counselling_received') @Default(false) bool nutritionCounsellingReceived,
    @JsonKey(name: 'weight_monitored') @Default(false) bool weightMonitored,
    @JsonKey(name: 'supplementary_nutrition_received') @Default(false) bool supplementaryNutritionReceived,
  }) = _MaternalNutritionModel;

  factory MaternalNutritionModel.fromJson(Map<String, dynamic> json) =>
      _$MaternalNutritionModelFromJson(json);
}

@freezed
abstract class MedicineTrackerItem with _$MedicineTrackerItem {
  const factory MedicineTrackerItem({
    @Default(0) int taken,
    @Default(0) int total,
  }) = _MedicineTrackerItem;

  factory MedicineTrackerItem.fromJson(Map<String, dynamic> json) =>
      _$MedicineTrackerItemFromJson(json);
}

@freezed
abstract class ImmunizationItem with _$ImmunizationItem {
  const factory ImmunizationItem({
    @JsonKey(name: 'dose_type') required String doseType,
    @Default('pending') String status, // 'pending' | 'received'
    String? date,
  }) = _ImmunizationItem;

  factory ImmunizationItem.fromJson(Map<String, dynamic> json) =>
      _$ImmunizationItemFromJson(json);
}

@freezed
abstract class UltrasoundItem with _$UltrasoundItem {
  const factory UltrasoundItem({
    @JsonKey(name: 'scan_type') required String scanType,
    @Default('due') String status, // 'due' | 'completed'
    @JsonKey(name: 'scan_date') String? scanDate,
  }) = _UltrasoundItem;

  factory UltrasoundItem.fromJson(Map<String, dynamic> json) =>
      _$UltrasoundItemFromJson(json);
}

@freezed
abstract class AncServicesModel with _$AncServicesModel {
  const factory AncServicesModel({
    @JsonKey(name: 'gestational_week') int? gestationalWeek,
    int? trimester,
    required String edd,
    @JsonKey(name: 'high_risk_status') @Default('NA') String highRiskStatus, // 'Yes'|'No'|'NA'
    @JsonKey(name: 'high_risk_flags') @Default([]) List<String> highRiskFlags,
    @JsonKey(name: 'bpcr_score_percent') double? bpcrScorePercent,
    @JsonKey(name: 'visit_progress') @Default([]) List<VisitProgressItem> visitProgress,
    @JsonKey(name: 'pregnancy_registration') required PregnancyRegistrationModel pregnancyRegistration,
    @JsonKey(name: 'maternal_nutrition') required MaternalNutritionModel maternalNutrition,
    @JsonKey(name: 'anc_visit_timeline') @Default([]) List<AncVisitTimelineItem> ancVisitTimeline,
    @JsonKey(name: 'medicine_tracker') @Default({}) Map<String, MedicineTrackerItem> medicineTracker,
    @Default([]) List<ImmunizationItem> immunization,
    @Default([]) List<UltrasoundItem> ultrasound,
    @JsonKey(name: 'total_visits') @Default(0) int totalVisits,
    @JsonKey(name: 'next_due_date') String? nextDueDate,
    @JsonKey(name: 'is_overdue') @Default(false) bool isOverdue,
    @JsonKey(name: 'overdue_days') int? overdueDays,
  }) = _AncServicesModel;

  factory AncServicesModel.fromJson(Map<String, dynamic> json) =>
      _$AncServicesModelFromJson(json);
}