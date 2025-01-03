
import 'package:drift/drift.dart' as drift;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_management_app/model/project/project.dart';


part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  factory Task({
    required String taskId,
    required String taskTitle,
    required String taskDesc,
    required DateTime dueDate,
    required Priority priority,
    required String projectId,
  }) = _Task;
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

class TaskDatabaseTable extends drift.Table {
  drift.IntColumn get id => integer().autoIncrement()();
  drift.TextColumn get taskId => text()();
  drift.TextColumn get taskTitle => text()();
  drift.TextColumn get taskDesc => text()();
  drift.DateTimeColumn get dueDate => dateTime()();
  drift.IntColumn get status => intEnum<Priority>()();
  drift.TextColumn get projectId =>
      text().references(ProjectDatabaseTable, #projectId)();
}

enum Priority { low, medium, high }
