import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/model/task/task.dart';

class HomeState {
  int filterValue;

  HomeState({required this.filterValue});

  HomeState copyWith({int? filterValue}) {
    return HomeState(filterValue: filterValue ?? this.filterValue);
  }

  factory HomeState.initial() {
    return HomeState(filterValue: -1);
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
}

final homeProvider = NotifierProvider<HomeNotifier, HomeState>(() {
  return HomeNotifier();
});
