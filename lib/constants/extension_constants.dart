import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/model/project/project.dart';
import 'package:project_management_app/model/task/task.dart';
import 'package:project_management_app/repository/database_repo.dart';
import 'package:project_management_app/theme/app_colors.dart';

extension BuildContextExtensions on BuildContext {
  double get deviceTopPadding => MediaQuery.of(this).padding.top;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => MediaQuery.sizeOf(this);

  void showSnackBar(String message, [Duration? duration]) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: AppColors.whiteColor,
        content: Text(
          message,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: AppColors.whiteColor,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.red,
        duration: duration ?? const Duration(seconds: 2),
      ),
    );
  }
}

extension DateTimeFormatting on DateTime {
  String toMMMDD() {
    return DateFormat('MMM dd').format(this);
  }
}

extension StringCasingExtension on String {
  String get toCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized)
      .join(' ');
}

extension TaskToCompanion on Task {
  TaskDatabaseTableCompanion toCompanion() {
    return TaskDatabaseTableCompanion(
        taskId: Value(taskId),
        taskTitle: Value(taskTitle),
        taskDesc: Value(taskDesc),
        dueDate: Value(dueDate),
        status: Value(priority),
        projectId: Value(projectId),
        isCompleted: Value(isCompleted),
        reminderDateTime: Value(reminderDateTime),
        repeat: Value(repeat),
        totalFocusedSessionsInSeconds: Value(totalFocusedSessionsInSeconds));
  }
}

extension ProjectToCompanion on Project {
  ProjectDatabaseTableCompanion toCompanion() {
    return ProjectDatabaseTableCompanion(
        projectId: Value(projectId), projectTitle: Value(projectTitle));
  }
}

extension ProjectDataListToProjectList on List<ProjectDatabaseTableData> {
  List<Project> toProjectList() {
    return map((projectData) {
      return Project(
          projectId: projectData.projectId,
          projectTitle: projectData.projectTitle);
    }).toList();
  }
}

extension TaskDataListToTaskList on List<TaskDatabaseTableData> {
  List<Task> toTaskList() {
    return map((taskData) {
      return Task(
          totalFocusedSessionsInSeconds: taskData.totalFocusedSessionsInSeconds,
          taskId: taskData.taskId,
          taskTitle: taskData.taskTitle,
          taskDesc: taskData.taskDesc,
          dueDate: taskData.dueDate,
          priority: taskData.status,
          projectId: taskData.projectId,
          reminderDateTime: taskData.reminderDateTime,
          isCompleted: taskData.isCompleted,
          repeat: taskData.repeat);
    }).toList();
  }
}

extension DurationClockFormat on Duration {
  String toClockFormat() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}

extension TimeConversion on int {
  String toHoursAndMinutes() {
    int hours = this ~/ 3600;
    int minutes = (this % 3600) ~/ 60;
    return '${hours}h ${minutes}m';
  }
}

extension StatusExtension on PomodoroTimerType {
  String readableText() {
    switch (this) {
      case PomodoroTimerType.focusSession:
        return 'Focus Session';
      case PomodoroTimerType.longBreak:
        return 'Long Break';
      case PomodoroTimerType.shortBreak:
        return 'Short Break';
    }
  }
}

extension PriorityExtension on Priority {
  String readableText() {
    switch (this) {
      case Priority.high:
        return 'High';
      case Priority.medium:
        return 'Medium';
      case Priority.low:
        return 'Low';
    }
  }
}
