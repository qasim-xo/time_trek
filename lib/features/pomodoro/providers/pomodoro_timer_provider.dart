import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as fln;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_settings_provider.dart';
import 'package:project_management_app/features/pomodoro/services/audio_service.dart';
import 'package:project_management_app/features/pomodoro/services/notification_service.dart';
import 'package:project_management_app/main.dart';
import 'package:project_management_app/shared/providers/floating_pomodoro_timer_provider.dart';

class PomodoroTimerState {
  String taskId;
  bool isRunning;
  PomodoroTimerType pomodoroTimerType;
  Timer timer;
  Duration? pomodoroTime;
  int? countFocusSessions;
  Duration selectedPomodoroTime;
  int totalFocusedSessionsInSeconds;
  int lastFocusedSessionPausedInSeconds;

  PomodoroTimerState(
      {required this.taskId,
      required this.isRunning,
      required this.timer,
      required this.pomodoroTime,
      required this.pomodoroTimerType,
      required this.countFocusSessions,
      required this.selectedPomodoroTime,
      required this.totalFocusedSessionsInSeconds,
      required this.lastFocusedSessionPausedInSeconds});

  PomodoroTimerState copyWith({
    String? taskId,
    bool? isRunning,
    Timer? timer,
    Duration? pomodoroTime,
    bool? isBreak,
    int? countFocusSessions,
    Duration? selectedPomodoroTime,
    PomodoroTimerType? pomodoroTimerType,
    int? totalFocusedSessionsInSeconds,
    int? lastFocusedSessionPausedInSeconds,
  }) {
    return PomodoroTimerState(
        taskId: taskId ?? this.taskId,
        isRunning: isRunning ?? this.isRunning,
        timer: timer ?? this.timer,
        pomodoroTime: pomodoroTime ?? this.pomodoroTime,
        selectedPomodoroTime: selectedPomodoroTime ?? this.selectedPomodoroTime,
        pomodoroTimerType: pomodoroTimerType ?? this.pomodoroTimerType,
        countFocusSessions: countFocusSessions ?? this.countFocusSessions,
        totalFocusedSessionsInSeconds:
            totalFocusedSessionsInSeconds ?? this.totalFocusedSessionsInSeconds,
        lastFocusedSessionPausedInSeconds: lastFocusedSessionPausedInSeconds ??
            this.lastFocusedSessionPausedInSeconds);
  }

  factory PomodoroTimerState.initial() {
    return PomodoroTimerState(
        lastFocusedSessionPausedInSeconds: 1500,
        totalFocusedSessionsInSeconds: 0,
        selectedPomodoroTime: Duration(minutes: 25, seconds: 0),
        taskId: '',
        countFocusSessions: 0,
        isRunning: false,
        timer: Timer(Duration.zero, () {}),
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

  void setSelectedPomodoroTime(Duration time) {
    state = state.copyWith(selectedPomodoroTime: time);
    resetFields();
  }

  void setPomodoroTime(Duration newTime) {
    state = state.copyWith(pomodoroTime: newTime);
    // setSelectedPomodoroTime(newTime);
  }

  void showFloatingTimerWidget(bool isWidgetActive) {
    ref
        .read(floatingPomodoroTimerProvider.notifier)
        .setIsWidgetActive(isWidgetActive);
  }

  void startTimer() {
    setIsRunning(true);
    playSelectedSound();

    state = state.copyWith(
      timer: Timer.periodic(
        const Duration(seconds: 1),
        (timer) => _onTick(timer),
      ),
    );
  }

  void startFocusSession() {
    showFloatingTimerWidget(true);
    startTimer();
    showNotificationWithTimer();
  }

  void _onTick(Timer timer) {
    if (state.pomodoroTime == null) {
      pauseTimer();
      return;
    }

    final updatedTime = state.pomodoroTime! - const Duration(seconds: 1);
    setPomodoroTime(updatedTime);

    showNotificationWithTimer();

    int minutes = updatedTime.inMinutes;
    int seconds = updatedTime.inSeconds % 60;

    if (minutes <= 0 && seconds <= 0) {
      _handleSessionEnd(timer);
    }
  }

  void playSelectedSound() {
    ref.read(pomodoroSettingsProvider.notifier).playSelectedSound();
  }

  // void playClockTickSound() {
  //   ref.read(pomodoroSettingsProvider.notifier).playClockTickSound();
  // }

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
      setSelectedPomodoroTime(focusSession);
    } else if (state.pomodoroTimerType == PomodoroTimerType.focusSession) {
      debugPrint("Count Focus Sessions : ${state.countFocusSessions}");
      state = state.copyWith(pomodoroTimerType: PomodoroTimerType.shortBreak);
      setPomodoroTime(shortBreak);
      setSelectedPomodoroTime(shortBreak);
    }
  }

  void startLongBreak() {
    final longBreak = ref.read(pomodoroSettingsProvider).longBreak;
    final focusSession = ref.read(pomodoroSettingsProvider).focusSession;

    if (state.pomodoroTimerType == PomodoroTimerType.longBreak) {
      state = state.copyWith(pomodoroTimerType: PomodoroTimerType.focusSession);
      setPomodoroTime(focusSession);
      setSelectedPomodoroTime(focusSession);
    } else if (state.pomodoroTimerType == PomodoroTimerType.focusSession) {
      state = state.copyWith(pomodoroTimerType: PomodoroTimerType.longBreak);
      setPomodoroTime(longBreak);
      setSelectedPomodoroTime(longBreak);
    }
  }

  void setTaskIdAndProjectIdTimerIsRunningFor(String taskId) {
    state = state.copyWith(taskId: taskId);
  }

  void cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  void pauseTimer() {
    state = state.copyWith(isRunning: false);
    state.timer.cancel();
    cancelNotification();

    AudioService().stopSound();
    // ref.read(pomodoroSettingsProvider.notifier).setIsPlaySound(false);

    if (state.pomodoroTimerType == PomodoroTimerType.focusSession) {
      final oldFocusedSessionTimerValue =
          ref.read(onPauseStateProvider.notifier).state;
      state = state.copyWith(
          lastFocusedSessionPausedInSeconds:
              oldFocusedSessionTimerValue); //1500
      ref.read(onPauseStateProvider.notifier).state =
          state.pomodoroTime!.inSeconds; //1300
      storeFocusedSessionTimerValueInDb();
    }
  }

  void storeFocusedSessionTimerValueInDb() {
    final task = ref
        .read(taskProvider)
        .taskList
        .firstWhere((task) => task.taskId == state.taskId);
    final calculateChangeBetweenLastFocusedPausedAndRunningTimer =
        (state.lastFocusedSessionPausedInSeconds -
            state.pomodoroTime!.inSeconds);

    state.totalFocusedSessionsInSeconds = task.totalFocusedSessionsInSeconds +
        calculateChangeBetweenLastFocusedPausedAndRunningTimer;
    state = state.copyWith(
        totalFocusedSessionsInSeconds: state.totalFocusedSessionsInSeconds);

    ref.read(taskProvider.notifier).updateTask(task.copyWith(
        totalFocusedSessionsInSeconds: state.totalFocusedSessionsInSeconds));
  }

  void resetTimer() {
    final focusSession = ref.read(pomodoroSettingsProvider).focusSession;

    setIsRunning(false);

    state.timer.cancel();

    showFloatingTimerWidget(false);
    state = state.copyWith(pomodoroTimerType: PomodoroTimerType.focusSession);
    setPomodoroTime(focusSession);
    setSelectedPomodoroTime(focusSession);
    resetFields();
  }

  void resetFields() {
    state = state.copyWith(
        lastFocusedSessionPausedInSeconds:
            state.selectedPomodoroTime.inSeconds);
    state = state.copyWith(totalFocusedSessionsInSeconds: 0);

    ref.read(onPauseStateProvider.notifier).state =
        state.selectedPomodoroTime.inSeconds;
  }

  void showNotificationWithTimer() async {
    fln.NotificationDetails platformChannelSpecifics = fln.NotificationDetails(
      android: NotificationService().androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Pomodoro Timer',
      payload: 'pomodoro',
      state.pomodoroTime?.toClockFormat(),
      platformChannelSpecifics,
    );
  }
}

final pomodoroTimerProvider =
    NotifierProvider<PomodoroTimerNotifier, PomodoroTimerState>(
        PomodoroTimerNotifier.new);

final onPauseStateProvider = StateProvider<int>(
    (ref) => ref.read(pomodoroTimerProvider).selectedPomodoroTime.inSeconds);
