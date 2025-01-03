import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_settings_provider.dart';


class PomodoroTimerState {
  bool isRunning;
  PomodoroTimerType pomodoroTimerType; 
  Timer? timer;
  Duration? time;
  int? countFocusSessions ; 
  

  PomodoroTimerState(
      {required this.isRunning,
      required this.timer,
      required this.time,
      required this.pomodoroTimerType,
      required this.countFocusSessions
      });

  PomodoroTimerState copyWith(
      {bool? isRunning, Timer? timer, Duration? time, bool? isBreak, int? countFocusSessions, PomodoroTimerType? pomodoroTimerType}) {
    return PomodoroTimerState(
        isRunning: isRunning ?? this.isRunning,
        timer: timer ?? this.timer,
        time: time ?? this.time,
        pomodoroTimerType: pomodoroTimerType ?? this.pomodoroTimerType,
        countFocusSessions: countFocusSessions ?? this.countFocusSessions
        );
  }

  factory PomodoroTimerState.initial() {
    return PomodoroTimerState(
        countFocusSessions: 1,
        isRunning: false,
        timer: null,
        time: const Duration(minutes: 25, seconds: 0),
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

  void setTime(Duration newTime) {
    state = state.copyWith(time: newTime);
  }

void startFocusSession() {
  state = state.copyWith(
    isRunning: true,
    timer: Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
     
        if (state.time == null) {
          timer.cancel();
          state = state.copyWith(isRunning: false);
          return;
        }

    
        final updatedTime = state.time! - const Duration(seconds: 1);
        state = state.copyWith(time: updatedTime);

  
        int minutes = updatedTime.inMinutes;
        int seconds = updatedTime.inSeconds % 60;

        
        if (minutes <= 0 && seconds <= 0) {
          timer.cancel();
          state = state.copyWith(isRunning: false, timer: null);
          startShortBreak();
        }
      },
    ),
  );
}



  void startShortBreak () 
  {
    final focusSession = ref.read(pomodoroSettingsProvider).focusSession;
    final shortBreak = ref.read(pomodoroSettingsProvider).shortBreak;

      if (state.pomodoroTimerType==PomodoroTimerType.shortBreak) {
          state = state.copyWith(pomodoroTimerType: PomodoroTimerType.focusSession);
          setTime(focusSession);
        } else if (state.pomodoroTimerType==PomodoroTimerType.focusSession) {
          state.countFocusSessions = state.countFocusSessions! + 1;
          state.copyWith(countFocusSessions: state.countFocusSessions);
          debugPrint("Count Focus Sessions : ${state.countFocusSessions}");
          state = state.copyWith(pomodoroTimerType: PomodoroTimerType.shortBreak);
          setTime(shortBreak);
        }
        else 
        {
           
        }
  }


  void startLongBreak () 
  {
    final longBreak = ref.read(pomodoroSettingsProvider).longBreak;
    final focusSession = ref.read(pomodoroSettingsProvider).focusSession;
    final longBreakInterval = ref.read(pomodoroSettingsProvider).longBreakInterval;

    if (state.countFocusSessions! % longBreakInterval == 0) {
      state = state.copyWith(isBreak: true);
      setTime(longBreak);
    } else {
      state = state.copyWith(isBreak: false);
      setTime(focusSession);
    }
  }

  void pauseTimer() {
    state = state.copyWith(isRunning: false);
    state.timer!.cancel();
  }
}

final pomodoroTimerProvider =
    NotifierProvider<PomodoroTimerNotifier, PomodoroTimerState>(
   PomodoroTimerNotifier.new
);
