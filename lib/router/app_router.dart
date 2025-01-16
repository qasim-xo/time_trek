import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_management_app/features/add_show_project/screens/add_project_screen.dart';
import 'package:project_management_app/features/add_show_project/screens/show_project_screen.dart';
import 'package:project_management_app/features/add_show_task/screens/add_task_screen.dart';
import 'package:project_management_app/features/add_show_task/screens/show_task_screen.dart';
import 'package:project_management_app/features/pomodoro/screens/pomodoro_screen.dart';
import 'package:project_management_app/model/project/project.dart';
import 'package:project_management_app/model/task/task.dart';

part "app_router.gr.dart";

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter();
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
          page: ShowProjectRoute.page, initial: true, path: '/show-project'),
      AutoRoute(page: AddProjectRoute.page, path: '/add-project'),
      AutoRoute(page: ShowTaskRoute.page, path: '/show-task'),
      AutoRoute(page: AddTaskRoute.page, path: '/add-task'),
      AutoRoute(page: PomodoroRoute.page, path: '/pomodoro')
    ];
  }
}
