import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_settings_provider.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_timer_provider.dart';
import 'package:project_management_app/theme/app_colors.dart';

class PomodoroTimerWidget extends ConsumerWidget {
  const PomodoroTimerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pomodoroTimerType =
        ref.watch(pomodoroTimerProvider).pomodoroTimerType;

    final time = ref.watch(pomodoroTimerProvider).pomodoroTime;
    // final focusSession =
    //     ref.watch(pomodoroSettingsProvider).focusSession.inSeconds;
    // final longBreak = ref.watch(pomodoroSettingsProvider).longBreak.inSeconds;
    // final shortBreak = ref.watch(pomodoroSettingsProvider).shortBreak.inSeconds;
    final selectedPomodoroTime = ref.read(pomodoroTimerProvider).selectedPomodoroTime; 

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200.0,
          child: Stack(
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Builder(
                    builder: (BuildContext context) {
                      double progress = time!.inSeconds/selectedPomodoroTime.inSeconds;

                    //   if (isRunning)
                    //   {
                    //     if (pomodoroTimerType == PomodoroTimerType.focusSession) {
                    //     progress = (time!.inSeconds) / focusSession;
                    //   } else if (pomodoroTimerType ==
                    //       PomodoroTimerType.shortBreak) {
                    //     progress = (time!.inSeconds) / shortBreak;
                    //   } else {
                    //     progress = (time!.inSeconds) / longBreak;
                    //   }
                    // }

                     

                      return CircularProgressIndicator(
                        strokeCap: StrokeCap.round,
                        backgroundColor: AppColors.titleColor,
                        strokeWidth: 10,
                        value: progress,
                      );
                    },
                  ),
                ),
              ),
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(time!.toClockFormat(),
                      style: context.textTheme.titleMedium
                          ?.copyWith(fontSize: 40.0)),
                  pomodoroTimerType == PomodoroTimerType.focusSession
                      ? Text(
                          "Focus Session",
                        )
                      : pomodoroTimerType == PomodoroTimerType.shortBreak
                          ? Text(
                              "Short Break",
                            )
                          : Text("Long Break"),
                ],
              )),
            ],
          ),
        ),
      ],
    );
  }
}
