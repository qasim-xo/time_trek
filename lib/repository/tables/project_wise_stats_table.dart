import 'package:drift/drift.dart';
import 'package:project_management_app/repository/tables/task_table.dart';

class ProjectWiseStatsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get projectId =>
      text().references(TaskDatabaseTable, #projectId)();

  DateTimeColumn get date => dateTime()();

  IntColumn get totalFocusedSessionsOnDateInSeconds =>
      integer().withDefault(Constant(0))();
}
