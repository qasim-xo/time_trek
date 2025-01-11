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
