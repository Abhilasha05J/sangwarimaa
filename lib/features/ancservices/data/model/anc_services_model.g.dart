// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anc_services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecklistItemModel _$ChecklistItemModelFromJson(Map<String, dynamic> json) =>
    _ChecklistItemModel(
      key: json['key'] as String,
      labelHi: json['label_hi'] as String?,
      labelEn: json['label_en'] as String?,
      checked: json['checked'] as bool? ?? false,
    );

Map<String, dynamic> _$ChecklistItemModelToJson(_ChecklistItemModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label_hi': instance.labelHi,
      'label_en': instance.labelEn,
      'checked': instance.checked,
    };

_AncVisitTimelineItem _$AncVisitTimelineItemFromJson(
  Map<String, dynamic> json,
) => _AncVisitTimelineItem(
  visitNumber: (json['visit_number'] as num).toInt(),
  titleHi: json['title_hi'] as String?,
  titleEn: json['title_en'] as String?,
  weekRange: json['week_range'] as String,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => ChecklistItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  testsCompleted: (json['tests_completed'] as num?)?.toInt() ?? 0,
  testsTotal: (json['tests_total'] as num?)?.toInt() ?? 0,
  status: json['status'] as String? ?? 'due',
  visitDate: json['visit_date'] as String?,
);

Map<String, dynamic> _$AncVisitTimelineItemToJson(
  _AncVisitTimelineItem instance,
) => <String, dynamic>{
  'visit_number': instance.visitNumber,
  'title_hi': instance.titleHi,
  'title_en': instance.titleEn,
  'week_range': instance.weekRange,
  'items': instance.items,
  'tests_completed': instance.testsCompleted,
  'tests_total': instance.testsTotal,
  'status': instance.status,
  'visit_date': instance.visitDate,
};

_VisitProgressItem _$VisitProgressItemFromJson(Map<String, dynamic> json) =>
    _VisitProgressItem(
      visitNumber: (json['visit_number'] as num).toInt(),
      weekRange: json['week_range'] as String,
      isCompleted: json['is_completed'] as bool? ?? false,
    );

Map<String, dynamic> _$VisitProgressItemToJson(_VisitProgressItem instance) =>
    <String, dynamic>{
      'visit_number': instance.visitNumber,
      'week_range': instance.weekRange,
      'is_completed': instance.isCompleted,
    };

_PregnancyRegistrationModel _$PregnancyRegistrationModelFromJson(
  Map<String, dynamic> json,
) => _PregnancyRegistrationModel(
  isRegistered: json['is_registered'] as bool? ?? false,
  registeredDate: json['registered_date'] as String?,
  rchIdGenerated: json['rch_id_generated'] as bool? ?? false,
  rchId: json['rch_id'] as String?,
  mcpCardReceived: json['mcp_card_received'] as bool? ?? false,
  ashaAssigned: json['asha_assigned'] as bool? ?? false,
);

Map<String, dynamic> _$PregnancyRegistrationModelToJson(
  _PregnancyRegistrationModel instance,
) => <String, dynamic>{
  'is_registered': instance.isRegistered,
  'registered_date': instance.registeredDate,
  'rch_id_generated': instance.rchIdGenerated,
  'rch_id': instance.rchId,
  'mcp_card_received': instance.mcpCardReceived,
  'asha_assigned': instance.ashaAssigned,
};

_MaternalNutritionModel _$MaternalNutritionModelFromJson(
  Map<String, dynamic> json,
) => _MaternalNutritionModel(
  nutritionCounsellingReceived:
      json['nutrition_counselling_received'] as bool? ?? false,
  weightMonitored: json['weight_monitored'] as bool? ?? false,
  supplementaryNutritionReceived:
      json['supplementary_nutrition_received'] as bool? ?? false,
);

Map<String, dynamic> _$MaternalNutritionModelToJson(
  _MaternalNutritionModel instance,
) => <String, dynamic>{
  'nutrition_counselling_received': instance.nutritionCounsellingReceived,
  'weight_monitored': instance.weightMonitored,
  'supplementary_nutrition_received': instance.supplementaryNutritionReceived,
};

_MedicineTrackerItem _$MedicineTrackerItemFromJson(Map<String, dynamic> json) =>
    _MedicineTrackerItem(
      taken: (json['taken'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MedicineTrackerItemToJson(
  _MedicineTrackerItem instance,
) => <String, dynamic>{'taken': instance.taken, 'total': instance.total};

_ImmunizationItem _$ImmunizationItemFromJson(Map<String, dynamic> json) =>
    _ImmunizationItem(
      doseType: json['dose_type'] as String,
      status: json['status'] as String? ?? 'pending',
      date: json['date'] as String?,
    );

Map<String, dynamic> _$ImmunizationItemToJson(_ImmunizationItem instance) =>
    <String, dynamic>{
      'dose_type': instance.doseType,
      'status': instance.status,
      'date': instance.date,
    };

_UltrasoundItem _$UltrasoundItemFromJson(Map<String, dynamic> json) =>
    _UltrasoundItem(
      scanType: json['scan_type'] as String,
      status: json['status'] as String? ?? 'due',
      scanDate: json['scan_date'] as String?,
    );

Map<String, dynamic> _$UltrasoundItemToJson(_UltrasoundItem instance) =>
    <String, dynamic>{
      'scan_type': instance.scanType,
      'status': instance.status,
      'scan_date': instance.scanDate,
    };

_AncServicesModel _$AncServicesModelFromJson(
  Map<String, dynamic> json,
) => _AncServicesModel(
  gestationalWeek: (json['gestational_week'] as num?)?.toInt(),
  trimester: (json['trimester'] as num?)?.toInt(),
  edd: json['edd'] as String,
  highRiskStatus: json['high_risk_status'] as String? ?? 'NA',
  highRiskFlags:
      (json['high_risk_flags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  bpcrScorePercent: (json['bpcr_score_percent'] as num?)?.toDouble(),
  visitProgress:
      (json['visit_progress'] as List<dynamic>?)
          ?.map((e) => VisitProgressItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  pregnancyRegistration: PregnancyRegistrationModel.fromJson(
    json['pregnancy_registration'] as Map<String, dynamic>,
  ),
  maternalNutrition: MaternalNutritionModel.fromJson(
    json['maternal_nutrition'] as Map<String, dynamic>,
  ),
  ancVisitTimeline:
      (json['anc_visit_timeline'] as List<dynamic>?)
          ?.map((e) => AncVisitTimelineItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  medicineTracker:
      (json['medicine_tracker'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          k,
          MedicineTrackerItem.fromJson(e as Map<String, dynamic>),
        ),
      ) ??
      const {},
  immunization:
      (json['immunization'] as List<dynamic>?)
          ?.map((e) => ImmunizationItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  ultrasound:
      (json['ultrasound'] as List<dynamic>?)
          ?.map((e) => UltrasoundItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  totalVisits: (json['total_visits'] as num?)?.toInt() ?? 0,
  nextDueDate: json['next_due_date'] as String?,
  isOverdue: json['is_overdue'] as bool? ?? false,
  overdueDays: (json['overdue_days'] as num?)?.toInt(),
);

Map<String, dynamic> _$AncServicesModelToJson(_AncServicesModel instance) =>
    <String, dynamic>{
      'gestational_week': instance.gestationalWeek,
      'trimester': instance.trimester,
      'edd': instance.edd,
      'high_risk_status': instance.highRiskStatus,
      'high_risk_flags': instance.highRiskFlags,
      'bpcr_score_percent': instance.bpcrScorePercent,
      'visit_progress': instance.visitProgress,
      'pregnancy_registration': instance.pregnancyRegistration,
      'maternal_nutrition': instance.maternalNutrition,
      'anc_visit_timeline': instance.ancVisitTimeline,
      'medicine_tracker': instance.medicineTracker,
      'immunization': instance.immunization,
      'ultrasound': instance.ultrasound,
      'total_visits': instance.totalVisits,
      'next_due_date': instance.nextDueDate,
      'is_overdue': instance.isOverdue,
      'overdue_days': instance.overdueDays,
    };
