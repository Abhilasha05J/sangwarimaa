import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

/// One row per "mark medicine as taken" action that couldn't reach the
/// backend immediately (offline, or app was killed when the notification
/// action fired). Only the TAKEN action queues here — Skip and
/// Remind-in-30-min are purely local/no-backend, so they never touch this.
class PendingMedicineActions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get medicineType => text()(); // 'iron' | 'calcium'
  TextColumn get takenDate => text()();    // ISO 'YYYY-MM-DD', captured at tap time
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [PendingMedicineActions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Singleton — both the main isolate (app-open sync) and a background
  // isolate (notification action tap while app is killed) can safely
  // construct this independently; drift's NativeDatabase handles multiple
  // connections to the same file.
  static final AppDatabase instance = AppDatabase();

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'sangwari_maa.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}