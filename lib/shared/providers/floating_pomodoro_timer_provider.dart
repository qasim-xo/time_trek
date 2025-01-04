import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingPomodoroTimerState {
  bool isWidgetActive;

  FloatingPomodoroTimerState({required this.isWidgetActive});

  FloatingPomodoroTimerState copyWith({bool? isWidgetActive}) {
    return FloatingPomodoroTimerState(
      isWidgetActive: isWidgetActive ?? this.isWidgetActive,
    );
  }

  factory FloatingPomodoroTimerState.initial() {
    return FloatingPomodoroTimerState(isWidgetActive: false);
  }
}

class FloatingPomodoroTimerNotifier
    extends Notifier<FloatingPomodoroTimerState> {
  @override
  FloatingPomodoroTimerState build() {
    return FloatingPomodoroTimerState.initial();
  }

  void setIsWidgetActive(bool newIsWidgetActive) {
    state = state.copyWith(isWidgetActive: newIsWidgetActive);
  }
}

final floatingPomodoroTimerProvider =
    NotifierProvider<FloatingPomodoroTimerNotifier, FloatingPomodoroTimerState>(
        FloatingPomodoroTimerNotifier.new);
