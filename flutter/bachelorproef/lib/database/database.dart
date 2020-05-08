import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

//Moor (like Room) uses generation, hence the file spec.
part 'database.g.dart';

class TestTable extends Table {

  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
}

// This annotation tells the code generator which tables this DB works with
@UseMoor(tables: [TestTable],daos: [TestDao])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
  )));

  // Bump this when changing tables and columns.
  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [TestTable])
class TestDao extends DatabaseAccessor<AppDatabase> with _$TestDaoMixin {
  final AppDatabase db;

  TestDao(this.db) : super(db);

  Future<void> insertEntity(TestTableData entity) => into(testTable).insert(entity);
  Future<List<TestTableData>> getAllTasks() => select(testTable).get();
  Future<void> updateTask(TestTableData entity) => update(testTable).replace(entity);
  Future<void> deleteTask(TestTableData entity) => delete(testTable).delete(entity);
}