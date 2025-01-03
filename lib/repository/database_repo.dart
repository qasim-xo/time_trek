import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/model/project/project.dart';
import 'package:project_management_app/model/task/task.dart';

part 'database_repo.g.dart';

@DriftDatabase(tables: [TaskDatabaseTable, ProjectDatabaseTable])
class AppDatabase extends _$AppDatabase {
  static final _instance = AppDatabase._internal();
  factory AppDatabase() => _instance;

  AppDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }

  Future<int> addTask(TaskDatabaseTableCompanion task) {
    return into(taskDatabaseTable).insert(task);
  }

  Future<List<TaskDatabaseTableData>> loadAllTasks() async {
    final List<TaskDatabaseTableData> tasks = await taskDatabaseTable.all().get();
    return tasks;
  }

  Future<void> deleteTask(String taskId) async {
    await (delete(taskDatabaseTable)..where((t) => t.taskId.equals(taskId))).go();
  }

  Future<void> updateTask(Task task) async {
    await (update(taskDatabaseTable)..where((t) => t.taskId.equals(task.taskId)))
        .write(task.toCompanion());
  }

  Future<int> addProject(ProjectDatabaseTableCompanion project) {
    return into(projectDatabaseTable).insert(project);
  }

  Future<List<ProjectDatabaseTableData>> loadAllProjects() async {
    final List<ProjectDatabaseTableData> tasks = await projectDatabaseTable.all().get();
    return tasks;
  }

  Future<void> deleteProject(String projectId) async {

    await (delete(taskDatabaseTable)..where((t) => t.projectId.equals(projectId))).go();

    await (delete(projectDatabaseTable)..where((p) => p.projectId.equals(projectId)))
        .go();
  }

  Future<void> updateProject(Project project) async {
    await (update(projectDatabaseTable)
          ..where((p) => p.projectId.equals(project.projectId)))
        .write(project.toCompanion());
  }
}
