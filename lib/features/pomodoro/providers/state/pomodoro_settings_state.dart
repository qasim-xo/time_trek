class PomodoroSettingsState {
  Duration focusSession;
  Duration shortBreak;
  Duration longBreak;
  int longBreakInterval;
  bool isPlaySound;
  int selectedRadioButton;

  PomodoroSettingsState(
      {required this.focusSession,
      required this.shortBreak,
      required this.longBreak,
      required this.longBreakInterval,
      required this.isPlaySound,
      required this.selectedRadioButton});

  PomodoroSettingsState copyWith(
      {Duration? focusSession,
      Duration? shortBreak,
      Duration? longBreak,
      int? longBreakInterval,
      bool? isPlaySound,
      int? selectedRadioButton}) {
    return PomodoroSettingsState(
        focusSession: focusSession ?? this.focusSession,
        shortBreak: shortBreak ?? this.shortBreak,
        longBreak: longBreak ?? this.longBreak,
        longBreakInterval: longBreakInterval ?? this.longBreakInterval,
        isPlaySound: isPlaySound ?? this.isPlaySound,
        selectedRadioButton: selectedRadioButton ?? this.selectedRadioButton);
  }

  factory PomodoroSettingsState.initial() {
    return PomodoroSettingsState(
        focusSession: const Duration(minutes: 25, seconds: 0),
        shortBreak: const Duration(minutes: 5),
        longBreak: const Duration(minutes: 15),
        longBreakInterval: 4,
        isPlaySound: false,
        selectedRadioButton: 1);
  }
}
