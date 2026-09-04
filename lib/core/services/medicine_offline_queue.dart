import 'package:sangwari_maa/core/database/app_database.dart';

/// Enqueue a "taken" action — safe to call from any isolate, including
/// the background notification-action handler when the app is killed.
Future<void> enqueueMedicineTaken(String medicineType, DateTime date) async {
  final isoDate = date.toIso8601String().split('T').first;
  await AppDatabase.instance.into(AppDatabase.instance.pendingMedicineActions).insert(
    PendingMedicineActionsCompanion.insert(
      medicineType: medicineType,
      takenDate: isoDate,
    ),
  );
}

/// Returns all queued actions — read from the main isolate on app open.
Future<List<PendingMedicineAction>> getPendingMedicineActions() {
  return AppDatabase.instance.select(AppDatabase.instance.pendingMedicineActions).get();
}

Future<void> removePendingMedicineAction(int id) {
  return (AppDatabase.instance.delete(AppDatabase.instance.pendingMedicineActions)
    ..where((t) => t.id.equals(id)))
      .go();
}