import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/ui_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/features/add_show_task/providers/show_task_provider.dart';
import 'package:project_management_app/features/add_show_task/widgets/task_card_widget.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_timer_provider.dart';
import 'package:project_management_app/router/app_router.dart';
import 'package:project_management_app/shared/providers/floating_pomodoro_timer_provider.dart';
import 'package:project_management_app/shared/widgets/floating_pomodoro_timer_widget.dart';

@RoutePage()
class ShowTaskScreen extends ConsumerStatefulWidget {
  const ShowTaskScreen({super.key, required this.projectId});

  final String projectId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowTaskScreenState();
}

class _ShowTaskScreenState extends ConsumerState<ShowTaskScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(taskProvider.notifier).fetchAllTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref
        .watch(taskProvider)
        .filteredTaskList
        .where((task) => task.projectId == widget.projectId)
        .toList();

    final isWidgetActive =
        ref.watch(floatingPomodoroTimerProvider).isWidgetActive;
    final taskId = ref.watch(pomodoroTimerProvider).taskId;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
              onPressed: () {
                context.router.push(AddTaskRoute());
              },
              icon: Icon(Icons.add_box_rounded)),
          PopupMenuButton(
            icon: const Icon(Icons.filter_alt),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 1, child: Text("High")),
              const PopupMenuItem(value: 2, child: Text("Medium")),
              const PopupMenuItem(value: 3, child: Text("Low")),
              const PopupMenuItem(value: 4, child: Text("Show all tasks"))
            ],
            onSelected: (value) {
              ref.read(homeProvider.notifier).setFilterValue(value);
            },
          )
        ],
      ),
      body: Padding(
        padding: homePadding,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap:
                      isWidgetActive == false || taskId == tasks[index].taskId
                          ? () {
                              ref
                                  .read(pomodoroTimerProvider.notifier)
                                  .setTaskIdAndProjectIdTimerIsRunningFor(
                                      tasks[index].taskId);
                              context.router.push(const PomodoroRoute());
                            }
                          : () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("My Super title"),
                                      content: Text("Hello World"),
                                    );
                                  });
                            },
                  child: TaskCardWidget(task: tasks[index]));
            },
            itemCount: tasks.length,
          ),
          isWidgetActive && (taskId != '' || taskId.isNotEmpty)
              ? SizedBox(height: 102, child: FloatingPomodoroTimerWidget())
              : SizedBox.shrink()
        ]),
      ),
    );
  }
}
