import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/model/project/project.dart';
import 'package:project_management_app/repository/database_repo.dart';
import 'package:uuid/uuid.dart';

class ProjectState {
  List<Project> projectList;
  String projectId;
  String projectTitle;

  ProjectState(
      {required this.projectList,
      required this.projectId,
      required this.projectTitle});

  ProjectState copyWith(
      {String? projectId, String? projectTitle, List<Project>? projectList}) {
    return ProjectState(
        projectList: projectList ?? this.projectList,
        projectId: projectId ?? this.projectId,
        projectTitle: projectTitle ?? this.projectTitle);
  }

  factory ProjectState.initial() {
    return ProjectState(projectList: [], projectId: '', projectTitle: '');
  }
}

class ProjectNotifier extends Notifier<ProjectState> {
  @override
  ProjectState build() {
    // TODO: implement build
    return ProjectState.initial();
  }

  void addProject() {
    var projectId = const Uuid().v4();
    final newProject =
        Project(projectId: projectId, projectTitle: state.projectTitle);

    state = state.copyWith(projectList: [...state.projectList, newProject]);
    AppDatabase().projectDao.addProject(newProject.toCompanion());
  }

  void setProjectTitle(String projectTitle) {
    state = state.copyWith(projectTitle: projectTitle);
  }

  void setProjectId(String projectId) {
    state = state.copyWith(projectId: projectId);
  }

  void fetchAllProjects() async {
    final tasks = await AppDatabase().projectDao.loadAllProjects();
    state = state.copyWith(projectList: tasks.toProjectList());
  }

  void deleteProject(Project project) {
    int index = state.projectList.indexOf(project);
    final deletedProjectListItem = state.projectList.toList();
    deletedProjectListItem.removeAt(index);

    state = state.copyWith(projectList: deletedProjectListItem);

    AppDatabase().projectDao.deleteProject(project.projectId);
  }

  void updateProject(Project project) {
    final index =
        state.projectList.indexWhere((p) => p.projectId == project.projectId);
    final newProjectList = state.projectList.toList();

    newProjectList[index] = project;

    state = state.copyWith(projectList: newProjectList);

    AppDatabase().projectDao.updateProject(project);
  }

  // void setProjectList(List<Project> projectList) {
  //   state = state.copyWith(projectList: projectList);
  // }

  void resetFieldsOnScreenLaunch() {
    state = state.copyWith(projectTitle: '');
  }
}

final projectProvider = NotifierProvider<ProjectNotifier, ProjectState>(() {
  return ProjectNotifier();
});
