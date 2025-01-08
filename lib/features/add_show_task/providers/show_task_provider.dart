import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/model/task/task.dart';

class HomeState {
  int filterValue;

  HomeState({
    required this.filterValue,
  });

  HomeState copyWith({int? filterValue, bool? isCompleted}) {
    return HomeState(
      filterValue: filterValue ?? this.filterValue,
    );
  }

  factory HomeState.initial() {
    return HomeState(
      filterValue: -1,
    );
  }
}

class HomeNotifier extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState.initial();
  }

  void setFilterValue(int value) {
    state = state.copyWith(filterValue: value);
    filterTaskList();
  }

  void toggleIsCompleted(Task task, bool? newValue) {
    //  state = state.copyWith(isCompleted: !state.isCompleted);
    ref
        .read(taskProvider.notifier)
        .updateTask(task.copyWith(isCompleted: newValue ?? false));
  }

  void filterTaskList() {
    final taskList = ref.read(taskProvider).taskList;
    if (state.filterValue == 1) {
      final tasks =
          taskList.where((task) => task.priority == Priority.high).toList();
      ref.read(taskProvider.notifier).setTaskList(tasks);
    } else if (state.filterValue == 2) {
      final tasks =
          taskList.where((task) => task.priority == Priority.medium).toList();
      ref.read(taskProvider.notifier).setTaskList(tasks);
    } else if (state.filterValue == 3) {
      final tasks =
          taskList.where((task) => task.priority == Priority.low).toList();
      ref.read(taskProvider.notifier).setTaskList(tasks);
    } else {
      ref.read(taskProvider.notifier).setTaskList(taskList);
    }
  }

  int getNumberOfTasksCompleted(String projectId) {
    int count = 0;
    final tasks = ref
        .read(taskProvider)
        .taskList
        .where((task) => task.projectId == projectId)
        .toList();

    for (Task task in tasks) {
      if (task.isCompleted) {
        count++;
      }
    }

    return count;
  }

  int getTotalHoursSpentOnTheProject(String projectId) {
    final tasks = ref
        .read(taskProvider)
        .taskList
        .where((task) => task.projectId == projectId)
        .toList();
    int totalHours = 0;

    for (Task task in tasks) {
      totalHours = totalHours + task.totalFocusedSessionsInSeconds;
    }

    return totalHours;
  }
}

final showTaskProvider = NotifierProvider<HomeNotifier, HomeState>(() {
  return HomeNotifier();
});
