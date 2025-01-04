import 'package:drift/drift.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/model/task/task.dart';
import 'package:project_management_app/repository/tables/project_table.dart';

class TaskDatabaseTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get taskId => text()();
  TextColumn get taskTitle => text()();
  TextColumn get taskDesc => text()();
  DateTimeColumn get dueDate => dateTime()();
  IntColumn get status => intEnum<Priority>()();
  TextColumn get projectId =>
      text().references(ProjectDatabaseTable, #projectId)();
}
