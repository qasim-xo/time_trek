import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/ui_constants.dart';
import 'package:project_management_app/features/add_show_project/providers/project_provider.dart';
import 'package:project_management_app/features/add_show_project/widgets/project_card_widget.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/router/app_router.dart';

@RoutePage()
class ShowProjectScreen extends ConsumerStatefulWidget {
  const ShowProjectScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShowProjectScreenState();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(AddProjectRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: homePadding,
        child: ListView.builder(
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
      ),
    );
  }
}
