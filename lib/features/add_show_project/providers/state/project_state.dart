import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_management_app/model/project/project.dart';

part 'project_state.freezed.dart';

@freezed
abstract class ProjectState with _$ProjectState {
  factory ProjectState({
    required List<Project> projectList,
    required String projectId,
    required String projectTitle,
  }) = _ProjectState;

  factory ProjectState.initial() {
    return ProjectState(projectList: [], projectId: '', projectTitle: '');
  }
}
