import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/model/task/task.dart';

class HomeState {
  int filterValue;
  bool isCompleted; 

  HomeState({required this.filterValue,required this.isCompleted});

  HomeState copyWith({int? filterValue, bool? isCompleted}) {
    return HomeState(filterValue: filterValue ?? this.filterValue, isCompleted: isCompleted??this.isCompleted);
  }

  factory HomeState.initial() {
    return HomeState(filterValue: -1, isCompleted: false);
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


  void toggleIsCompleted (Task task, bool? newValue) 
  {
    //  state = state.copyWith(isCompleted: !state.isCompleted);
     ref.read(taskProvider.notifier).updateTask(task.copyWith(isCompleted: newValue??false));
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
