import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/features/add_show_project/providers/project_provider.dart';
import 'package:project_management_app/model/project/project.dart';

@RoutePage()
class AddProjectScreen extends ConsumerStatefulWidget {
  const AddProjectScreen({super.key, this.project});

  final Project? project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddProjectScreenState();
}

class _AddProjectScreenState extends ConsumerState<AddProjectScreen> {
  final TextEditingController projectTitleController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(projectProvider.notifier).resetFieldsOnScreenLaunch();
      if (widget.project != null) {
        projectTitleController.text = widget.project!.projectTitle;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.project != null
            ? const Text('Edit Project')
            : const Text('Add Project'),
      ),
      body: Column(
        children: [
          TextField(
            controller: projectTitleController,
            decoration: const InputDecoration(
              hintText: 'Project Title',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.project != null) {
                final updatedProject = Project(
                    projectId: widget.project?.projectId ?? '',
                    projectTitle: projectTitleController.text);

                ref
                    .read(projectProvider.notifier)
                    .updateProject(updatedProject);
              } else {
                ref
                    .read(projectProvider.notifier)
                    .setProjectTitle(projectTitleController.text);
                ref.read(projectProvider.notifier).addProject();
              }

              context.router.maybePop();
            },
            child: const Text('Add Project'),
          ),
        ],
      ),
    );
  }
}
