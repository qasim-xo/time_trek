import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/features/add_show_task/providers/show_task_provider.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_timer_provider.dart';
import 'package:project_management_app/model/task/task.dart';
import 'package:project_management_app/router/app_router.dart';
import 'package:project_management_app/theme/app_colors.dart';

class TaskCardWidget extends ConsumerStatefulWidget {
  const TaskCardWidget({super.key, required this.task});

  final Task task;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends ConsumerState<TaskCardWidget> {
  @override
  Widget build(BuildContext context) {
    final task = ref.watch(taskProvider).taskList.firstWhere((task)=>task.taskId==widget.task.taskId); 
    // final isRunning = ref.watch(pomodoroTimerProvider).isRunning; 
    return Card(
      color: AppColors.titleColor.withOpacity(0.08),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: task.isCompleted, onChanged: (bool? newValue){
                  ref.read(showTaskProvider.notifier).toggleIsCompleted(widget.task,newValue);
                }),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.taskTitle.toTitleCase,
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: AppColors.titleColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.timer_outlined,
                          color: AppColors.titleColor,
                          size: 17,
                        ),
                        Text(
                          " ${widget.task.dueDate.toMMMDD()}",
                          style: context.textTheme.bodyMedium
                              ?.copyWith(fontSize: 13),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.router.push(AddTaskRoute(task: widget.task));
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: AppColors.titleColor,
                    )),
                IconButton(
                    onPressed: () {

                      ref.read(taskProvider.notifier).deleteTask(widget.task);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.deleteColor,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
