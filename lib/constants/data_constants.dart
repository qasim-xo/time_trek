import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:project_management_app/constants/string_constants.dart';

DateTime currentTime = DateTime.now();

enum Priority { low, medium, high }

enum PomodoroTimerType {
  focusSession,
  shortBreak,
  longBreak,
}

List<String> FocusSoundsList = [
  birdsChirpingSound,
  clockTickSound,
  fireCrackingSound,
  keyboardSound,
  rainSound,
  whiteSound,
];

class TimeOfDayConverter extends TypeConverter<TimeOfDay, int> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromSql(int value) {
    final hour = value ~/ 60; // Get hours
    final minute = value % 60; // Get minutes
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  int toSql(TimeOfDay value) {
    return value.hour * 60 + value.minute; // Convert TimeOfDay to total minutes
  }
}
