import 'package:drift/drift.dart';

class ProjectDatabaseTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get projectId => text()();
  TextColumn get projectTitle => text()();
}
