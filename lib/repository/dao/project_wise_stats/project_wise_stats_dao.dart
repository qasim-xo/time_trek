import 'package:drift/drift.dart';
import 'package:project_management_app/repository/database_repo.dart';
import 'package:project_management_app/repository/tables/project_wise_stats_table.dart';

@DriftAccessor(tables: [ProjectWiseStatsTable])
class TaskDao extends DatabaseAccessor<AppDatabase> {
  TaskDao(super.attachedDatabase);

  Future<int> addTask(ProjectWiseStatsTableCompanion stats) {
    return into(db.projectWiseStatsTable).insert(stats);
  }
}
