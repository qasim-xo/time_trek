import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/ui_constants.dart';
import 'package:project_management_app/features/add_show_project/providers/project_provider.dart';
import 'package:project_management_app/features/add_show_project/widgets/project_card_widget.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_timer_provider.dart';
import 'package:project_management_app/router/app_router.dart';
import 'package:project_management_app/shared/providers/floating_pomodoro_timer_provider.dart';
import 'package:project_management_app/shared/widgets/floating_pomodoro_timer_widget.dart';

@RoutePage()
class ShowProjectScreen extends ConsumerStatefulWidget {
  const ShowProjectScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShowProjectScreenState();
}

const platform = MethodChannel('android_app_retain');

Future<void> _sendToBackground() async {
  try {
    await platform.invokeMethod('sendToBackground');
  } on PlatformException catch (e) {
    print("Error while sending app to background: $e");
  }
}

class _ShowProjectScreenState extends ConsumerState<ShowProjectScreen> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(projectProvider.notifier).fetchAllProjects();
    });
  }

  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(projectProvider).projectList;

    final isWidgetActive =
        ref.watch(floatingPomodoroTimerProvider).isWidgetActive;
    final taskId = ref.watch(pomodoroTimerProvider).taskId;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        actions: [
          IconButton(
              onPressed: () {
                context.router.push(AddProjectRoute());
              },
              icon: Icon(Icons.add_box))
        ],
      ),
      body: Padding(
        padding: homePadding,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    ref
                        .read(taskProvider.notifier)
                        .setProjectId(projects[index].projectId);

                    context.router.push(
                        ShowTaskRoute(projectId: projects[index].projectId));
                  },
                  child: ProjectCardWidget(project: projects[index]));
            },
            itemCount: projects.length,
          ),
          isWidgetActive && (taskId != '' || taskId.isNotEmpty)
              ? SizedBox(height: 102, child: FloatingPomodoroTimerWidget())
              : SizedBox.shrink()
        ]),
      ),
    );
  }
}
