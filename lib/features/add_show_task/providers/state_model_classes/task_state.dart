import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/model/task/task.dart';

part 'task_state.freezed.dart';

@freezed
abstract class TaskState with _$TaskState {
  factory TaskState({
    required List<Task> taskList,
    required List<Task> filteredTaskList,
    required DateTime selectedDate,
    required Priority priority,
    required String title,
    required String desc,
    required String projectId,
    DateTime? reminderDate,
    TimeOfDay? reminderTime,
    DateTime? reminderDateTime,
    required bool repeat,
  }) = _TaskState;

  factory TaskState.initial() {
    return TaskState(
        projectId: '',
        taskList: [],
        selectedDate: DateTime.now(),
        priority: Priority.low,
        title: '',
        desc: '',
        reminderDate: null,
        reminderTime: null,
        repeat: false,
        filteredTaskList: []);
  }
}
