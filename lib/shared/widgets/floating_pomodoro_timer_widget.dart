import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_timer_provider.dart';
import 'package:project_management_app/theme/app_colors.dart';

class FloatingPomodoroTimerWidget extends ConsumerWidget {
  const FloatingPomodoroTimerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskId = ref.watch(pomodoroTimerProvider).taskId;
    final task = ref
        .watch(taskProvider)
        .taskList
        .firstWhere((task) => task.taskId == taskId);

    final pomodoroTime = ref.watch(pomodoroTimerProvider).pomodoroTime;
    final pomodoroTimerType =
        ref.watch(pomodoroTimerProvider).pomodoroTimerType;
    final isRunning = ref.watch(pomodoroTimerProvider).isRunning;
    return Card(
      elevation: 0,
      color: AppColors.floatingPomodoroTimerWidgetColor,
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.taskTitle.toTitleCase,
                    style: context.textTheme.titleMedium
                        ?.copyWith(fontSize: 20, color: AppColors.whiteColor),
                  ),
                  Text(
                    "${pomodoroTime!.toClockFormat()} (${pomodoroTimerType.toString().split('.').last})",
                    style: context.textTheme.titleMedium
                        ?.copyWith(fontSize: 15, color: AppColors.whiteColor),
                  )
                ],
              ),
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.whiteColor),
                child: Center(
                  child: IconButton(
                      iconSize: 40,
                      onPressed: isRunning == false
                          ? () {
                              ref
                                  .read(pomodoroTimerProvider.notifier)
                                  .startFocusSession();
                            }
                          : () {
                              ref
                                  .read(pomodoroTimerProvider.notifier)
                                  .pauseTimer();
                            },
                      icon: isRunning
                          ? Icon(Icons.play_arrow_rounded)
                          : Icon(Icons.pause)),
                ),
              )
            ],
          )),
    );
  }
}
