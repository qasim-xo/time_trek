import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_timer_provider.dart';
import 'package:project_management_app/theme/app_colors.dart';

class PomodoroStatsWidget extends ConsumerWidget {
  const PomodoroStatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final runningTaskId = ref.watch(pomodoroTimerProvider).taskId ;
    final runningTask = ref.watch(taskProvider).taskList.firstWhere((task)=>task.taskId==runningTaskId);
    final totalFocusSessions = ref.watch(pomodoroTimerProvider).countFocusSessions;
    return Card(
      elevation: 0,
      color: AppColors.floatingPomodoroTimerWidgetColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Focused hours spent on this task: ${runningTask.totalFocusedSessionsInSeconds.toHoursAndMinutes()}", style: context.textTheme.titleMedium?.copyWith(color: AppColors.whiteColor),), 
            Text("Today's total focus sessions: $totalFocusSessions", style: context.textTheme.titleMedium?.copyWith(color: AppColors.whiteColor),)
          ],
        ),
      ),
    );
  }
}