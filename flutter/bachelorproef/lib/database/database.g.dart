// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TestTableData extends DataClass implements Insertable<TestTableData> {
  final int id;
  TestTableData({@required this.id});
  factory TestTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return TestTableData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    return map;
  }

  factory TestTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TestTableData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  TestTableData copyWith({int id}) => TestTableData(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('TestTableData(')..write('id: $id')..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(id.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) || (other is TestTableData && other.id == this.id);
}

class TestTableCompanion extends UpdateCompanion<TestTableData> {
  final Value<int> id;
  const TestTableCompanion({
    this.id = const Value.absent(),
  });
  TestTableCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<TestTableData> custom({
    Expression<int> id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  TestTableCompanion copyWith({Value<int> id}) {
    return TestTableCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }
}

class $TestTableTable extends TestTable
    with TableInfo<$TestTableTable, TestTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $TestTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  $TestTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'test_table';
  @override
  final String actualTableName = 'test_table';
  @override
  VerificationContext validateIntegrity(Insertable<TestTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TestTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TestTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TestTableTable createAlias(String alias) {
    return $TestTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TestTableTable _testTable;
  $TestTableTable get testTable => _testTable ??= $TestTableTable(this);
  TestDao _testDao;
  TestDao get testDao => _testDao ??= TestDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [testTable];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TestDaoMixin on DatabaseAccessor<AppDatabase> {
  $TestTableTable get testTable => attachedDatabase.testTable;
}
