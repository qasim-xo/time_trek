// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddProjectScreen]
class AddProjectRoute extends PageRouteInfo<AddProjectRouteArgs> {
  AddProjectRoute({
    Key? key,
    Project? project,
    List<PageRouteInfo>? children,
  }) : super(
          AddProjectRoute.name,
          args: AddProjectRouteArgs(
            key: key,
            project: project,
          ),
          initialChildren: children,
        );

  static const String name = 'AddProjectRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddProjectRouteArgs>(
          orElse: () => const AddProjectRouteArgs());
      return AddProjectScreen(
        key: args.key,
        project: args.project,
      );
    },
  );
}

class AddProjectRouteArgs {
  const AddProjectRouteArgs({
    this.key,
    this.project,
  });

  final Key? key;

  final Project? project;

  @override
  String toString() {
    return 'AddProjectRouteArgs{key: $key, project: $project}';
  }
}

/// generated route for
/// [AddTaskScreen]
class AddTaskRoute extends PageRouteInfo<AddTaskRouteArgs> {
  AddTaskRoute({
    Key? key,
    Task? task,
    List<PageRouteInfo>? children,
  }) : super(
          AddTaskRoute.name,
          args: AddTaskRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'AddTaskRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<AddTaskRouteArgs>(orElse: () => const AddTaskRouteArgs());
      return AddTaskScreen(
        key: args.key,
        task: args.task,
      );
    },
  );
}

class AddTaskRouteArgs {
  const AddTaskRouteArgs({
    this.key,
    this.task,
  });

  final Key? key;

  final Task? task;

  @override
  String toString() {
    return 'AddTaskRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [PomodoroScreen]
class PomodoroRoute extends PageRouteInfo<void> {
  const PomodoroRoute({List<PageRouteInfo>? children})
      : super(
          PomodoroRoute.name,
          initialChildren: children,
        );

  static const String name = 'PomodoroRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PomodoroScreen();
    },
  );
}

/// generated route for
/// [ShowProjectScreen]
class ShowProjectRoute extends PageRouteInfo<void> {
  const ShowProjectRoute({List<PageRouteInfo>? children})
      : super(
          ShowProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShowProjectRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ShowProjectScreen();
    },
  );
}

/// generated route for
/// [ShowTaskScreen]
class ShowTaskRoute extends PageRouteInfo<ShowTaskRouteArgs> {
  ShowTaskRoute({
    Key? key,
    required String projectId,
    List<PageRouteInfo>? children,
  }) : super(
          ShowTaskRoute.name,
          args: ShowTaskRouteArgs(
            key: key,
            projectId: projectId,
          ),
          initialChildren: children,
        );

  static const String name = 'ShowTaskRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ShowTaskRouteArgs>();
      return ShowTaskScreen(
        key: args.key,
        projectId: args.projectId,
      );
    },
  );
}

class ShowTaskRouteArgs {
  const ShowTaskRouteArgs({
    this.key,
    required this.projectId,
  });

  final Key? key;

  final String projectId;

  @override
  String toString() {
    return 'ShowTaskRouteArgs{key: $key, projectId: $projectId}';
  }
}
