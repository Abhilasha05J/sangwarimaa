import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/features/ancservices/data/model/anc_services_model.dart';
import 'package:sangwari_maa/features/ancservices/presentation/anc_services_provider.dart';

part 'anc_services_controller.g.dart';

@riverpod
class AncServicesController extends _$AncServicesController {
  @override
  Future<AncServicesModel> build() {
    return ref.read(ancServicesRepositoryProvider).getAncServices();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(ancServicesRepositoryProvider).getAncServices());
  }

  Future<void> toggleChecklistItem(int visitNumber, String itemKey, bool checked) async {
    final current = state.value;
    if (current == null) return;

    final optimisticTimeline = current.ancVisitTimeline.map((v) {
      if (v.visitNumber != visitNumber) return v;
      final newItems = v.items.map((i) => i.key == itemKey ? i.copyWith(checked: checked) : i).toList();
      final checkedCount = newItems.where((i) => i.checked).length;
      return v.copyWith(
        items: newItems,
        testsCompleted: checkedCount,
        status: (checkedCount == newItems.length && newItems.isNotEmpty) ? 'completed' : 'due',
      );
    }).toList();
    state = AsyncValue.data(current.copyWith(ancVisitTimeline: optimisticTimeline));

    try {
      await ref.read(ancServicesRepositoryProvider).updateChecklistItem(visitNumber, itemKey, checked);
    } catch (_) {
      state = AsyncValue.data(current);
    }
  }
// ── Add these methods ──
  Future<void> toggleRegistrationField(String field, bool checked) async {
    final current = state.value;
    if (current == null) return;

    PregnancyRegistrationModel applyField(PregnancyRegistrationModel reg) {
      return switch (field) {
        'is_registered' => reg.copyWith(isRegistered: checked),
        'rch_id_generated' => reg.copyWith(rchIdGenerated: checked),
        'mcp_card_received' => reg.copyWith(mcpCardReceived: checked),
        _ => reg,
      };
    }

    final optimisticReg = applyField(current.pregnancyRegistration);
    state = AsyncValue.data(current.copyWith(pregnancyRegistration: optimisticReg));

    try {
      await ref.read(ancServicesRepositoryProvider).updateRegistrationField(field, checked);
      // Server response already reflected optimistically above; no need to overwrite ashaAssigned.
    } catch (_) {
      state = AsyncValue.data(current);
    }
  }

  // ── Add ──
  Future<void> toggleMaternalNutritionField(String field, bool checked) async {
    final current = state.value;
    if (current == null) return;

    MaternalNutritionModel applyField(MaternalNutritionModel n) {
      return switch (field) {
        'nutrition_counselling_received' => n.copyWith(nutritionCounsellingReceived: checked),
        'weight_monitored' => n.copyWith(weightMonitored: checked),
        'supplementary_nutrition_received' => n.copyWith(supplementaryNutritionReceived: checked),
        _ => n,
      };
    }

    final optimistic = applyField(current.maternalNutrition);
    state = AsyncValue.data(current.copyWith(maternalNutrition: optimistic));

    try {
      await ref.read(ancServicesRepositoryProvider).updateMaternalNutritionField(field, checked);
    } catch (_) {
      state = AsyncValue.data(current);
    }
  }

  Future<List<String>> loadMedicineCalendar(String medicineType) {
    return ref.read(ancServicesRepositoryProvider).getMedicineCalendar(medicineType);
  }

  Future<void> toggleMedicineDate(String medicineType, DateTime date, bool taken) async {
    final current = state.value;
    if (current == null) return;
    final isoDate = date.toIso8601String().split('T').first;

    final previous = current.medicineTracker[medicineType];
    final defaultTotal = medicineType == 'iron' ? 180 : 360;
    final delta = taken ? 1 : -1;
    final optimisticTracker = Map<String, MedicineTrackerItem>.from(current.medicineTracker)
      ..[medicineType] = MedicineTrackerItem(
        taken: ((previous?.taken ?? 0) + delta).clamp(0, previous?.total ?? defaultTotal),
        total: previous?.total ?? defaultTotal,
      );
    state = AsyncValue.data(current.copyWith(medicineTracker: optimisticTracker));

    try {
      final updated = await ref.read(ancServicesRepositoryProvider).toggleMedicineDate(medicineType, isoDate, taken);
      final latest = state.value ?? current;
      final confirmedTracker = Map<String, MedicineTrackerItem>.from(latest.medicineTracker)..[medicineType] = updated;
      state = AsyncValue.data(latest.copyWith(medicineTracker: confirmedTracker));
    } catch (_) {
      state = AsyncValue.data(current);
    }
  }

  // Future<void> markMedicineTaken(String medicineType) async {
  //   final current = state.value;
  //   if (current == null) return;
  //   try {
  //     final updated = await ref.read(ancServicesRepositoryProvider).markMedicineTaken(medicineType);
  //     final newTracker = Map<String, MedicineTrackerItem>.from(current.medicineTracker)
  //       ..[medicineType] = updated;
  //     state = AsyncValue.data(current.copyWith(medicineTracker: newTracker));
  //   } catch (_) {
  //     // Swallow and let the UI show a snackbar via ref.listen if desired;
  //     // re-fetch as a safe fallback.
  //     await refresh();
  //   }
  // }
  Future<void> markMedicineTaken(String medicineType) async {
    final current = state.value;
    if (current == null) return;

    final defaultTotal = medicineType == 'iron' ? 180 : 360;
    final previous = current.medicineTracker[medicineType];
    final optimisticTracker = Map<String, MedicineTrackerItem>.from(current.medicineTracker)
      ..[medicineType] = MedicineTrackerItem(
        taken: ((previous?.taken ?? 0) + 1).clamp(0, previous?.total ?? defaultTotal),
        total: previous?.total ?? defaultTotal,
      );

    // Flip the UI immediately — don't wait on the network.
    state = AsyncValue.data(current.copyWith(medicineTracker: optimisticTracker));

    try {
      final updated = await ref.read(ancServicesRepositoryProvider).markMedicineTaken(medicineType);
      final latest = state.value ?? current;
      final confirmedTracker = Map<String, MedicineTrackerItem>.from(latest.medicineTracker)..[medicineType] = updated;
      state = AsyncValue.data(latest.copyWith(medicineTracker: confirmedTracker));
    } catch (_) {
      // Roll back to the pre-tap value on failure.
      state = AsyncValue.data(current);
    }
  }

  // Future<void> updateImmunization(String doseType, {required String status, String? receivedDate}) async {
  //   final current = state.value;
  //   if (current == null) return;
  //   final updated = await ref.read(ancServicesRepositoryProvider)
  //       .updateImmunization(doseType, status: status, receivedDate: receivedDate);
  //   final newList = current.immunization
  //       .map((i) => i.doseType == doseType ? updated : i)
  //       .toList();
  //   state = AsyncValue.data(current.copyWith(immunization: newList));
  // }
  Future<void> updateImmunization(String doseType, {required String status, String? receivedDate}) async {
    final current = state.value;
    if (current == null) return;

    final optimisticList = current.immunization
        .map((i) => i.doseType == doseType ? ImmunizationItem(doseType: doseType, status: status, date: receivedDate) : i)
        .toList();
    state = AsyncValue.data(current.copyWith(immunization: optimisticList));

    try {
      final updated = await ref.read(ancServicesRepositoryProvider)
          .updateImmunization(doseType, status: status, receivedDate: receivedDate);
      final latest = state.value ?? current;
      final confirmedList = latest.immunization.map((i) => i.doseType == doseType ? updated : i).toList();
      state = AsyncValue.data(latest.copyWith(immunization: confirmedList));
    } catch (_) {
      state = AsyncValue.data(current);
    }
  }

  // Future<void> updateUltrasound(String scanType, {required String status, String? scanDate}) async {
  //   final current = state.value;
  //   if (current == null) return;
  //   final updated = await ref.read(ancServicesRepositoryProvider)
  //       .updateUltrasound(scanType, status: status, scanDate: scanDate);
  //   final newList = current.ultrasound
  //       .map((s) => s.scanType == scanType ? updated : s)
  //       .toList();
  //   state = AsyncValue.data(current.copyWith(ultrasound: newList));
  // }
  Future<void> updateUltrasound(String scanType, {required String status, String? scanDate}) async {
    final current = state.value;
    if (current == null) return;

    final optimisticList = current.ultrasound
        .map((s) => s.scanType == scanType ? UltrasoundItem(scanType: scanType, status: status, scanDate: scanDate) : s)
        .toList();
    state = AsyncValue.data(current.copyWith(ultrasound: optimisticList));

    try {
      final updated = await ref.read(ancServicesRepositoryProvider)
          .updateUltrasound(scanType, status: status, scanDate: scanDate);
      final latest = state.value ?? current;
      final confirmedList = latest.ultrasound.map((s) => s.scanType == scanType ? updated : s).toList();
      state = AsyncValue.data(latest.copyWith(ultrasound: confirmedList));
    } catch (_) {
      state = AsyncValue.data(current);
    }
  }
}