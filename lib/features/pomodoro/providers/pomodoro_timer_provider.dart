import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/constants/string_constants.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_settings_provider.dart';
import 'package:project_management_app/shared/providers/floating_pomodoro_timer_provider.dart';

class PomodoroTimerState {
  String taskId;
  bool isRunning;
  PomodoroTimerType pomodoroTimerType;
  Timer? timer;
  Duration? pomodoroTime;
  int? countFocusSessions;

  PomodoroTimerState(
      {required this.taskId,
      required this.isRunning,
      required this.timer,
      required this.pomodoroTime,
      required this.pomodoroTimerType,
      required this.countFocusSessions});

  PomodoroTimerState copyWith(
      {String? taskId,
      bool? isRunning,
      Timer? timer,
      Duration? pomodoroTime,
      bool? isBreak,
      int? countFocusSessions,
      PomodoroTimerType? pomodoroTimerType}) {
    return PomodoroTimerState(
        taskId: taskId ?? this.taskId,
        isRunning: isRunning ?? this.isRunning,
        timer: timer ?? this.timer,
        pomodoroTime: pomodoroTime ?? this.pomodoroTime,
        pomodoroTimerType: pomodoroTimerType ?? this.pomodoroTimerType,
        countFocusSessions: countFocusSessions ?? this.countFocusSessions);
  }

  factory PomodoroTimerState.initial() {
    return PomodoroTimerState(
        taskId: '',
        countFocusSessions: 0,
        isRunning: false,
        timer: null,
        pomodoroTime: const Duration(minutes: 25, seconds: 0),
        pomodoroTimerType: PomodoroTimerType.focusSession);
  }
}

class PomodoroTimerNotifier extends Notifier<PomodoroTimerState> {
  @override
  PomodoroTimerState build() {
    return PomodoroTimerState.initial();
  }

  void setIsRunning(bool newIsRunning) {
    state = state.copyWith(isRunning: newIsRunning);
  }

  void setPomodoroTime(Duration newTime) {
    state = state.copyWith(pomodoroTime: newTime);
  }

  void showFloatingTimerWidget() {
    ref.read(floatingPomodoroTimerProvider.notifier).setIsWidgetActive(true);
  }

  void startTimer() {
    state = state.copyWith(
      isRunning: true,
      timer: Timer.periodic(
        const Duration(seconds: 1),
        (timer) => _onTick(timer),
      ),
    );
  }

  void startFocusSession() {
    showFloatingTimerWidget();
    startTimer();
  }

  void _onTick(Timer timer) {
    if (state.pomodoroTime == null) {
      pauseTimer();
      return;
    }

    playClockTickSound();

    final updatedTime = state.pomodoroTime! - const Duration(seconds: 1);
    setPomodoroTime(updatedTime);

    int minutes = updatedTime.inMinutes;
    int seconds = updatedTime.inSeconds % 60;

    if (minutes <= 0 && seconds <= 0) {
      _handleSessionEnd(timer);
    }
  }

  void playClockTickSound() {
    ref.read(pomodoroSettingsProvider.notifier).playClockTickSound();
  }

  void playAlarmSoundOnSessionEnd() {
    ref.read(pomodoroSettingsProvider.notifier).playAlarmSound();
  }

  void _handleSessionEnd(Timer timer) {
    if (state.pomodoroTimerType == PomodoroTimerType.focusSession) {
      state.countFocusSessions = state.countFocusSessions! + 1;
      state.copyWith(countFocusSessions: state.countFocusSessions);
    }
    playAlarmSoundOnSessionEnd();
    pauseTimer();
    final longBreakInterval =
        ref.read(pomodoroSettingsProvider).longBreakInterval;

    if (state.countFocusSessions! % longBreakInterval == 0) {
      startLongBreak();
    } else {
      debugPrint("Count Focus Sessions : ${state.countFocusSessions}");
      startShortBreak();
    }
  }

  void startShortBreak() {
    final focusSession = ref.read(pomodoroSettingsProvider).focusSession;
    final shortBreak = ref.read(pomodoroSettingsProvider).shortBreak;

    if (state.pomodoroTimerType == PomodoroTimerType.shortBreak) {
      state = state.copyWith(pomodoroTimerType: PomodoroTimerType.focusSession);
      setPomodoroTime(focusSession);
    } else if (state.pomodoroTimerType == PomodoroTimerType.focusSession) {
      debugPrint("Count Focus Sessions : ${state.countFocusSessions}");
      state = state.copyWith(pomodoroTimerType: PomodoroTimerType.shortBreak);
      setPomodoroTime(shortBreak);
    }
  }

  void startLongBreak() {
    final longBreak = ref.read(pomodoroSettingsProvider).longBreak;
    final focusSession = ref.read(pomodoroSettingsProvider).focusSession;

    if (state.pomodoroTimerType == PomodoroTimerType.longBreak) {
      state = state.copyWith(pomodoroTimerType: PomodoroTimerType.focusSession);
      setPomodoroTime(focusSession);
    } else if (state.pomodoroTimerType == PomodoroTimerType.focusSession) {
      state = state.copyWith(pomodoroTimerType: PomodoroTimerType.longBreak);
      setPomodoroTime(longBreak);
    }
  }

  void setTaskIdAndProjectIdTimerIsRunningFor(String taskId) {
    state = state.copyWith(taskId: taskId);
  }

  void pauseTimer() {
    state = state.copyWith(isRunning: false);
    state.timer!.cancel();
  }
}

final pomodoroTimerProvider =
    NotifierProvider<PomodoroTimerNotifier, PomodoroTimerState>(
        PomodoroTimerNotifier.new);
