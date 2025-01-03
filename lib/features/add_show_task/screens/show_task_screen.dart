import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/ui_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/features/add_show_task/providers/show_task_provider.dart';
import 'package:project_management_app/features/add_show_task/widgets/task_card_widget.dart';
import 'package:project_management_app/router/app_router.dart';

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

    final filterValue = ref.watch(homeProvider).filterValue;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(AddTaskRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: homePadding,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  context.router.push(const PomodoroRoute());
                },
                child: TaskCardWidget(task: tasks[index]));
          },
          itemCount: tasks.length,
        ),
      ),
    );
  }
}
