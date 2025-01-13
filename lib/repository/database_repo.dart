import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/repository/dao/project/project_dao.dart';
import 'package:project_management_app/repository/dao/task/task_dao.dart';
import 'package:project_management_app/repository/tables/project_table.dart';
import 'package:project_management_app/repository/tables/task_table.dart';
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

  TaskDao get taskDao => TaskDao(this);
  ProjectDao get projectDao => ProjectDao(this);
}
