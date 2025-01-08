import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/features/add_show_task/providers/show_task_provider.dart';
import 'package:project_management_app/theme/app_colors.dart';

class ProjectStatsWidget extends ConsumerWidget {
  const ProjectStatsWidget({super.key, required this.projectId});

  final String projectId; 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noOfTasksCompleted = ref.watch(showTaskProvider.notifier).getNumberOfTasksCompleted(projectId); 
    final totalTasks = ref.watch(taskProvider).taskList.where((task)=>task.projectId==projectId).toList(); 
    final focusedTimeSpentOnTheProject = ref.watch(showTaskProvider.notifier).getTotalHoursSpentOnTheProject(projectId);
    return Card(
      elevation: 0,
      color: AppColors.floatingPomodoroTimerWidgetColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Focused time spent on this project: ${focusedTimeSpentOnTheProject.toHoursAndMinutes()}", style: context.textTheme.titleMedium?.copyWith(color: AppColors.whiteColor),), 
            Text("Task to be completed: ${noOfTasksCompleted}/${totalTasks.length}", style: context.textTheme.titleMedium?.copyWith(color: AppColors.whiteColor),)
          ],
        ),
      ),
    );
  }
}