import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/data_constants.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';

class ReminderDialogBoxWidget extends ConsumerWidget {
  const ReminderDialogBoxWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminderTime = ref.watch(taskProvider).reminderTime;
    final reminderDate = ref.watch(taskProvider).reminderDate;
    final repeat = ref.watch(taskProvider).repeat;

    // print(
    //     "reminder time = ${reminderTime} and reminder date = ${reminderDate}");

    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              final reminderDateTime = DateTime(
                  reminderDate!.year,
                  reminderDate.month,
                  reminderDate.day,
                  reminderTime!.hour,
                  reminderTime.minute);
              ref
                  .read(taskProvider.notifier)
                  .setReminderDateTime(reminderDateTime);
            },
            child: Text("Save")),
        TextButton(
            onPressed: () {
              context.router.maybePop();
            },
            child: Text("Cancel"))
      ],
      title: Text("Select Reminder"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: currentTime,
                  lastDate: DateTime(3000),
                ).then((date) {
                  if (date != null) {
                    ref.read(taskProvider.notifier).setReminderDate(date);
                  }
                });
              },
              readOnly: true,
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.notifications),
                  hintText:
                      reminderDate == null ? 'Not set' : reminderDate.toMMMDD(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                  labelText: 'Pick Date')),
          SizedBox(
            height: 16,
          ),
          TextField(
              onTap: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((time) {
                  if (time != null) {
                    ref.read(taskProvider.notifier).setReminderTime(time);
                  }
                });
              },
              readOnly: true,
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.notifications),
                  hintText: reminderTime == null
                      ? 'Not set'
                      : reminderTime.format(context),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                  labelText: 'Pick Time')),
          SizedBox(
            height: 16,
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.all(0),
            value: repeat,
            onChanged: (bool? value) {
              ref.read(taskProvider.notifier).setRepeatCheckBox(value);
            },
            title: Text("Repeat?"),
          )
        ],
      ),
    );
  }
}
