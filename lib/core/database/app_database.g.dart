// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PendingMedicineActionsTable extends PendingMedicineActions
    with TableInfo<$PendingMedicineActionsTable, PendingMedicineAction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingMedicineActionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _medicineTypeMeta = const VerificationMeta(
    'medicineType',
  );
  @override
  late final GeneratedColumn<String> medicineType = GeneratedColumn<String>(
    'medicine_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _takenDateMeta = const VerificationMeta(
    'takenDate',
  );
  @override
  late final GeneratedColumn<String> takenDate = GeneratedColumn<String>(
    'taken_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    medicineType,
    takenDate,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_medicine_actions';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingMedicineAction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medicine_type')) {
      context.handle(
        _medicineTypeMeta,
        medicineType.isAcceptableOrUnknown(
          data['medicine_type']!,
          _medicineTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicineTypeMeta);
    }
    if (data.containsKey('taken_date')) {
      context.handle(
        _takenDateMeta,
        takenDate.isAcceptableOrUnknown(data['taken_date']!, _takenDateMeta),
      );
    } else if (isInserting) {
      context.missing(_takenDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingMedicineAction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingMedicineAction(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      medicineType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}medicine_type'],
          )!,
      takenDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}taken_date'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $PendingMedicineActionsTable createAlias(String alias) {
    return $PendingMedicineActionsTable(attachedDatabase, alias);
  }
}

class PendingMedicineAction extends DataClass
    implements Insertable<PendingMedicineAction> {
  final int id;
  final String medicineType;
  final String takenDate;
  final DateTime createdAt;
  const PendingMedicineAction({
    required this.id,
    required this.medicineType,
    required this.takenDate,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['medicine_type'] = Variable<String>(medicineType);
    map['taken_date'] = Variable<String>(takenDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PendingMedicineActionsCompanion toCompanion(bool nullToAbsent) {
    return PendingMedicineActionsCompanion(
      id: Value(id),
      medicineType: Value(medicineType),
      takenDate: Value(takenDate),
      createdAt: Value(createdAt),
    );
  }

  factory PendingMedicineAction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingMedicineAction(
      id: serializer.fromJson<int>(json['id']),
      medicineType: serializer.fromJson<String>(json['medicineType']),
      takenDate: serializer.fromJson<String>(json['takenDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'medicineType': serializer.toJson<String>(medicineType),
      'takenDate': serializer.toJson<String>(takenDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PendingMedicineAction copyWith({
    int? id,
    String? medicineType,
    String? takenDate,
    DateTime? createdAt,
  }) => PendingMedicineAction(
    id: id ?? this.id,
    medicineType: medicineType ?? this.medicineType,
    takenDate: takenDate ?? this.takenDate,
    createdAt: createdAt ?? this.createdAt,
  );
  PendingMedicineAction copyWithCompanion(
    PendingMedicineActionsCompanion data,
  ) {
    return PendingMedicineAction(
      id: data.id.present ? data.id.value : this.id,
      medicineType:
          data.medicineType.present
              ? data.medicineType.value
              : this.medicineType,
      takenDate: data.takenDate.present ? data.takenDate.value : this.takenDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingMedicineAction(')
          ..write('id: $id, ')
          ..write('medicineType: $medicineType, ')
          ..write('takenDate: $takenDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, medicineType, takenDate, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingMedicineAction &&
          other.id == this.id &&
          other.medicineType == this.medicineType &&
          other.takenDate == this.takenDate &&
          other.createdAt == this.createdAt);
}

class PendingMedicineActionsCompanion
    extends UpdateCompanion<PendingMedicineAction> {
  final Value<int> id;
  final Value<String> medicineType;
  final Value<String> takenDate;
  final Value<DateTime> createdAt;
  const PendingMedicineActionsCompanion({
    this.id = const Value.absent(),
    this.medicineType = const Value.absent(),
    this.takenDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PendingMedicineActionsCompanion.insert({
    this.id = const Value.absent(),
    required String medicineType,
    required String takenDate,
    this.createdAt = const Value.absent(),
  }) : medicineType = Value(medicineType),
       takenDate = Value(takenDate);
  static Insertable<PendingMedicineAction> custom({
    Expression<int>? id,
    Expression<String>? medicineType,
    Expression<String>? takenDate,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicineType != null) 'medicine_type': medicineType,
      if (takenDate != null) 'taken_date': takenDate,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PendingMedicineActionsCompanion copyWith({
    Value<int>? id,
    Value<String>? medicineType,
    Value<String>? takenDate,
    Value<DateTime>? createdAt,
  }) {
    return PendingMedicineActionsCompanion(
      id: id ?? this.id,
      medicineType: medicineType ?? this.medicineType,
      takenDate: takenDate ?? this.takenDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (medicineType.present) {
      map['medicine_type'] = Variable<String>(medicineType.value);
    }
    if (takenDate.present) {
      map['taken_date'] = Variable<String>(takenDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingMedicineActionsCompanion(')
          ..write('id: $id, ')
          ..write('medicineType: $medicineType, ')
          ..write('takenDate: $takenDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PendingMedicineActionsTable pendingMedicineActions =
      $PendingMedicineActionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pendingMedicineActions];
}

typedef $$PendingMedicineActionsTableCreateCompanionBuilder =
    PendingMedicineActionsCompanion Function({
      Value<int> id,
      required String medicineType,
      required String takenDate,
      Value<DateTime> createdAt,
    });
typedef $$PendingMedicineActionsTableUpdateCompanionBuilder =
    PendingMedicineActionsCompanion Function({
      Value<int> id,
      Value<String> medicineType,
      Value<String> takenDate,
      Value<DateTime> createdAt,
    });

class $$PendingMedicineActionsTableFilterComposer
    extends Composer<_$AppDatabase, $PendingMedicineActionsTable> {
  $$PendingMedicineActionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicineType => $composableBuilder(
    column: $table.medicineType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get takenDate => $composableBuilder(
    column: $table.takenDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingMedicineActionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingMedicineActionsTable> {
  $$PendingMedicineActionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicineType => $composableBuilder(
    column: $table.medicineType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get takenDate => $composableBuilder(
    column: $table.takenDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingMedicineActionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingMedicineActionsTable> {
  $$PendingMedicineActionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get medicineType => $composableBuilder(
    column: $table.medicineType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get takenDate =>
      $composableBuilder(column: $table.takenDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PendingMedicineActionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingMedicineActionsTable,
          PendingMedicineAction,
          $$PendingMedicineActionsTableFilterComposer,
          $$PendingMedicineActionsTableOrderingComposer,
          $$PendingMedicineActionsTableAnnotationComposer,
          $$PendingMedicineActionsTableCreateCompanionBuilder,
          $$PendingMedicineActionsTableUpdateCompanionBuilder,
          (
            PendingMedicineAction,
            BaseReferences<
              _$AppDatabase,
              $PendingMedicineActionsTable,
              PendingMedicineAction
            >,
          ),
          PendingMedicineAction,
          PrefetchHooks Function()
        > {
  $$PendingMedicineActionsTableTableManager(
    _$AppDatabase db,
    $PendingMedicineActionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PendingMedicineActionsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$PendingMedicineActionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$PendingMedicineActionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> medicineType = const Value.absent(),
                Value<String> takenDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PendingMedicineActionsCompanion(
                id: id,
                medicineType: medicineType,
                takenDate: takenDate,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String medicineType,
                required String takenDate,
                Value<DateTime> createdAt = const Value.absent(),
              }) => PendingMedicineActionsCompanion.insert(
                id: id,
                medicineType: medicineType,
                takenDate: takenDate,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingMedicineActionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingMedicineActionsTable,
      PendingMedicineAction,
      $$PendingMedicineActionsTableFilterComposer,
      $$PendingMedicineActionsTableOrderingComposer,
      $$PendingMedicineActionsTableAnnotationComposer,
      $$PendingMedicineActionsTableCreateCompanionBuilder,
      $$PendingMedicineActionsTableUpdateCompanionBuilder,
      (
        PendingMedicineAction,
        BaseReferences<
          _$AppDatabase,
          $PendingMedicineActionsTable,
          PendingMedicineAction
        >,
      ),
      PendingMedicineAction,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PendingMedicineActionsTableTableManager get pendingMedicineActions =>
      $$PendingMedicineActionsTableTableManager(
        _db,
        _db.pendingMedicineActions,
      );
}
