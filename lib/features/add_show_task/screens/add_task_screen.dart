import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/model/task/task.dart';
import 'package:project_management_app/shared/widgets/custom_textfield.dart';

@RoutePage()
class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key, this.task});

  final Task? task;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.task != null) {
        taskTitleController.text = widget.task!.taskTitle;
        taskDescriptionController.text = widget.task!.taskDesc;
        ref.read(taskProvider.notifier).onDateSelected(widget.task!.dueDate);
        ref.read(taskProvider.notifier).onOptionSelected(widget.task!.priority);
      } else {
        ref.read(taskProvider.notifier).resetFieldsOnScreenLaunch();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(taskProvider).selectedDate;
    final selectedOption = ref.watch(taskProvider).priority;

    return Scaffold(
      appBar: AppBar(
        title: widget.task != null
            ? const Text('Edit Task')
            : const Text('Create Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: taskTitleController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: taskDescriptionController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.flag),
                      hintText: selectedOption.readableText(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                      labelText: 'Priority',
                    ),
                    onTap: () async {
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(100.0, 220, 120, 0.0),
                        items: [
                          PopupMenuItem<Priority>(
                            value: Priority.low,
                            child: Text("Low"),
                            onTap: () {
                              ref
                                  .read(taskProvider.notifier)
                                  .onOptionSelected(Priority.low);
                            },
                          ),
                          PopupMenuItem<Priority>(
                            value: Priority.medium,
                            child: Text("Medium"),
                            onTap: () {
                              ref
                                  .read(taskProvider.notifier)
                                  .onOptionSelected(Priority.medium);
                            },
                          ),
                          PopupMenuItem<Priority>(
                            value: Priority.high,
                            child: Text("High"),
                            onTap: () {
                              ref
                                  .read(taskProvider.notifier)
                                  .onOptionSelected(Priority.high);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.calendar_today),
                      hintText: selectedDate.toMMMDD(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                      labelText: 'Due Date',
                    ),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: currentTime,
                        lastDate: DateTime(3000),
                      ).then((date) {
                        if (date != null) {
                          ref.read(taskProvider.notifier).onDateSelected(date);
                          // ref.read(selectedDateProvider.notifier).state = date;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (widget.task != null) {
                  final updatedTask = Task(
                      taskId: widget.task!.taskId,
                      taskTitle: taskTitleController.text,
                      taskDesc: taskDescriptionController.text,
                      dueDate: selectedDate,
                      priority: selectedOption,
                      projectId: widget.task!.projectId,
                      isCompleted: widget.task!.isCompleted);
                  ref.read(taskProvider.notifier).updateTask(updatedTask);
                } else {
                  ref
                      .read(taskProvider.notifier)
                      .setTaskTitleDescriptionAndProjectId(
                        taskTitleController.text,
                        taskDescriptionController.text,
                      );
                  ref.read(taskProvider.notifier).addTask();
                }
                context.maybePop();
              },
              child: const Text("Add Task"),
            ),
          ],
        ),
      ),
    );
  }
}
