import 'package:drift/drift.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/model/project/project.dart';
import 'package:project_management_app/repository/database_repo.dart';
import 'package:project_management_app/repository/tables/project_table.dart';

part 'project_dao.g.dart';

@DriftAccessor(tables: [ProjectDatabaseTable])
class ProjectDao extends DatabaseAccessor<AppDatabase> {
  ProjectDao(super.attachedDatabase);

  Future<int> addProject(ProjectDatabaseTableCompanion project) {
    return into(db.projectDatabaseTable).insert(project);
  }

  Future<List<ProjectDatabaseTableData>> loadAllProjects() async {
    final List<ProjectDatabaseTableData> tasks =
        await db.projectDatabaseTable.all().get();
    return tasks;
  }

  Future<void> deleteProject(String projectId) async {
    await (delete(db.taskDatabaseTable)
          ..where((t) => t.projectId.equals(projectId)))
        .go();

    await (delete(db.projectDatabaseTable)
          ..where((p) => p.projectId.equals(projectId)))
        .go();
  }

  Future<void> updateProject(Project project) async {
    await (update(db.projectDatabaseTable)
          ..where((p) => p.projectId.equals(project.projectId)))
        .write(project.toCompanion());
  }
}
