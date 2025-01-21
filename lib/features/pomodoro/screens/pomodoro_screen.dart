import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/ui_constants.dart';
import 'package:project_management_app/features/add_show_task/providers/add_task_provider.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_settings_provider.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_timer_provider.dart';
import 'package:project_management_app/features/pomodoro/widgets/pomodoro_settings_sheet_widget.dart';
import 'package:project_management_app/features/pomodoro/widgets/pomodoro_stats_widget.dart';
import 'package:project_management_app/features/pomodoro/widgets/pomodoro_timer_widget.dart';
import 'package:project_management_app/features/pomodoro/widgets/select_focus_sound_dialog_box_widget.dart';
import 'package:project_management_app/service/foreground_task_service.dart';
import 'package:project_management_app/shared/providers/floating_pomodoro_timer_provider.dart';

@RoutePage()
class PomodoroScreen extends ConsumerStatefulWidget {
  const PomodoroScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends ConsumerState<PomodoroScreen> {
  @override
  void initState() {
    // startService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final taskId = ref.watch(pomodoroTimerProvider).taskId;
    final taskTitle = ref
        .watch(taskProvider)
        .taskList
        .firstWhere((task) => task.taskId == taskId)
        .taskTitle;
    final isRunning = ref.watch(pomodoroTimerProvider).isRunning;
    final shortBreak = ref.watch(pomodoroSettingsProvider).shortBreak;

    final isPlaySound = ref.watch(pomodoroSettingsProvider).isPlaySound;

    debugPrint("screen short break : $shortBreak");
    return Scaffold(
        appBar: AppBar(
          title: Text(taskTitle),
          actions: [
            IconButton(
                onPressed: () {
                  ref
                      .read(pomodoroSettingsProvider.notifier)
                      .setIsPlaySound(!isPlaySound);
                },
                icon: isPlaySound
                    ? Icon(Icons.volume_up)
                    : Icon(Icons.volume_off)),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SelectFocusSoundDialogBoxWidget();
                      });
                },
                icon: Icon(Icons.music_note))
          ],
        ),
        body: Padding(
          padding: homePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const PomodoroStatsWidget(),
              const PomodoroTimerWidget(),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: isRunning == false
                          ? () async {
                              ref
                                  .read(pomodoroTimerProvider.notifier)
                                  .startFocusSession();
                            }
                          : () {
                              ref
                                  .read(pomodoroTimerProvider.notifier)
                                  .pauseTimer();
                            },
                      child: isRunning ? Text('Pause') : Text('Start')),
                  OutlinedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext c) {
                              return const PomodoroSettingsSheetWidget();
                            });
                      },
                      child: const Icon(Icons.settings))
                ],
              ),
              // isWidgetActive && (taskId != '' || taskId.isNotEmpty)
              //     ? FloatingPomodoroTimerWidget()
              //     : SizedBox.shrink()
            ],
          ),
        ));
  }
}
