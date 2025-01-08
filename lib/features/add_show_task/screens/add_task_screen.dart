import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/model/task/task.dart';

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
              decoration: const InputDecoration(
                hintText: "Enter Task Title",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: taskDescriptionController,
              decoration: const InputDecoration(
                hintText: "Enter Task Description",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Select Date: ${selectedDate.toLocal()}",
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
            const SizedBox(height: 16),
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text('High'),
                  leading: Radio<Priority>(
                    value: Priority.high,
                    groupValue: selectedOption,
                    activeColor: Colors.red,
                    onChanged: (Priority? value) {
                      ref
                          .read(taskProvider.notifier)
                          .onOptionSelected(value ?? Priority.high);
                      // ref.read(selectedOptionProvider.notifier).state = value;
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Medium'),
                  leading: Radio<Priority>(
                    value: Priority.medium,
                    groupValue: selectedOption,
                    activeColor: Colors.blue,
                    onChanged: (Priority? value) {
                      ref
                          .read(taskProvider.notifier)
                          .onOptionSelected(value ?? Priority.high);
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Low'),
                  leading: Radio<Priority>(
                    value: Priority.low,
                    groupValue: selectedOption,
                    activeColor: Colors.green,
                    onChanged: (Priority? value) {
                      ref
                          .read(taskProvider.notifier)
                          .onOptionSelected(value ?? Priority.high);
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
                      isCompleted: widget.task!.isCompleted
                      );
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
