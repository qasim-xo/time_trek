import 'package:drift/drift.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/model/task/task.dart';
import 'package:project_management_app/repository/database_repo.dart';
import 'package:project_management_app/repository/tables/task_table.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [TaskDatabaseTable])
class TaskDao extends DatabaseAccessor<AppDatabase> {
  TaskDao(super.attachedDatabase);

  Future<int> addTask(TaskDatabaseTableCompanion task) {
    return into(db.taskDatabaseTable).insert(task);
  }

  Future<List<TaskDatabaseTableData>> loadAllTasks() async {
    final List<TaskDatabaseTableData> tasks =
        await db.taskDatabaseTable.all().get();
    return tasks;
  }

  Future<void> deleteTask(String taskId) async {
    await (delete(db.taskDatabaseTable)..where((t) => t.taskId.equals(taskId)))
        .go();
  }

  Future<void> updateTask(Task task) async {
    await (update(db.taskDatabaseTable)
          ..where((t) => t.taskId.equals(task.taskId)))
        .write(task.toCompanion());
  }

  
}
