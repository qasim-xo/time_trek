import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/state_model_classes/task_state.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_timer_provider.dart';
import 'package:project_management_app/features/pomodoro/services/notification_service.dart';
import 'package:project_management_app/model/task/task.dart';
import 'package:project_management_app/repository/database_repo.dart';
// Adjust path as needed
import 'package:uuid/uuid.dart';

class TaskNotifier extends Notifier<TaskState> {
  @override
  TaskState build() {
    return TaskState.initial();
  }

  void addTask() {
    var taskId = const Uuid().v4();
    final newTask = Task(
        taskId: taskId,
        taskTitle: state.title,
        taskDesc: state.desc,
        dueDate: state.selectedDate,
        priority: state.priority,
        projectId: state.projectId,
        isCompleted: false,
        reminderDateTime: state.reminderDateTime,
        repeat: state.repeat);

    state = state.copyWith(
        taskList: [...state.taskList, newTask],
        filteredTaskList: [...state.filteredTaskList, newTask]);

    AppDatabase().taskDao.addTask(newTask.toCompanion());

    if (state.reminderDate != null && state.reminderTime != null) {
      setNotifications(state.reminderDate!, state.reminderTime!);
    }
  }

  void setNotifications(DateTime date, TimeOfDay time) {
    NotificationService().scheduleNotification(date, time);
  }

  void setProjectId(String projectId) {
    state = state.copyWith(projectId: projectId);
  }

  void updateTask(Task task) {
    final index =
        state.filteredTaskList.indexWhere((t) => t.taskId == task.taskId);
    final newTaskList = state.filteredTaskList.toList();

    newTaskList[index] = task;

    state =
        state.copyWith(filteredTaskList: newTaskList, taskList: newTaskList);

    AppDatabase().taskDao.updateTask(task);
  }

  void deleteTask(Task task) {
    // final isRunning = ref.read(pomodoroTimerProvider).isRunning;
    if (task.taskId == ref.read(pomodoroTimerProvider).taskId) {
      ref.read(pomodoroTimerProvider.notifier).resetTimer();
    }
    int index = state.filteredTaskList.indexOf(task);
    final deletedTaskListItem = state.filteredTaskList.toList();
    deletedTaskListItem.removeAt(index);
    state = state.copyWith(
        filteredTaskList: deletedTaskListItem, taskList: deletedTaskListItem);

    AppDatabase().taskDao.deleteTask(task.taskId);
  }

  void fetchAllTasks() async {
    final tasks = await AppDatabase().taskDao.loadAllTasks();
    state = state.copyWith(
        taskList: tasks.toTaskList(), filteredTaskList: tasks.toTaskList());
  }

  void onDateSelected(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  void onOptionSelected(Priority priority) {
    state = state.copyWith(priority: priority);
  }

  void setTaskTitleDescriptionAndProjectId(
    String title,
    String desc,
  ) {
    state = state.copyWith(
      title: title,
      desc: desc,
    );
  }

  void resetFieldsOnScreenLaunch() {
    state = state.copyWith(
        title: '',
        desc: '',
        selectedDate: DateTime.now(),
        reminderDateTime: null,
        priority: Priority.high);
  }

  void setTaskList(List<Task> tasks) {
    state = state.copyWith(filteredTaskList: tasks);
  }

  void setReminderDate(DateTime? date) {
    state = state.copyWith(reminderDate: date);
  }

  void setReminderDateTime(DateTime? dateTime) {
    state = state.copyWith(reminderDateTime: dateTime);
  }

  void setReminderTime(TimeOfDay? time) {
    state = state.copyWith(reminderTime: time);
  }

  void resetReminderDateAndReminderTime() {
    state = state.copyWith(reminderDate: null, reminderTime: null);
  }

  void setRepeatCheckBox(bool? value) {
    state = state.copyWith(repeat: value ?? false);
  }
}

final taskProvider = NotifierProvider<TaskNotifier, TaskState>(() {
  return TaskNotifier();
});
