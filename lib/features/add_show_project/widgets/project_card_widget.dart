import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/features/add_show_project/providers/project_provider.dart';
import 'package:project_management_app/model/project/project.dart';
import 'package:project_management_app/router/app_router.dart';
import 'package:project_management_app/theme/app_colors.dart';

class ProjectCardWidget extends ConsumerStatefulWidget {
  const ProjectCardWidget({super.key, required this.project});

  final Project project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends ConsumerState<ProjectCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.titleColor.withOpacity(0.08),
        elevation: 0,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.project.projectTitle.toTitleCase,
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: AppColors.titleColor),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ref
                              .read(projectProvider.notifier)
                              .deleteProject(widget.project);
                        },
                        icon: const Icon(Icons.delete,
                            color: AppColors.deleteColor)),
                    IconButton(
                        onPressed: () {
                          ref
                              .read(projectProvider.notifier)
                              .setProjectTitle(widget.project.projectTitle);
                          ref
                              .read(projectProvider.notifier)
                              .setProjectId(widget.project.projectId);

                          context.router
                              .push(AddProjectRoute(project: widget.project));
                        },
                        icon: const Icon(Icons.edit_outlined,
                            color: AppColors.titleColor))
                  ],
                )
              ],
            )));
  }
}
