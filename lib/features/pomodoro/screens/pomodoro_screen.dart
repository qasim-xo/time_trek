import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/ui_constants.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_settings_provider.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_timer_provider.dart';
import 'package:project_management_app/features/pomodoro/widgets/pomodoro_settings_sheet_widget.dart';
import 'package:project_management_app/features/pomodoro/widgets/pomodoro_timer_widget.dart';

@RoutePage()
class PomodoroScreen extends ConsumerStatefulWidget {
  const PomodoroScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends ConsumerState<PomodoroScreen> {

  @override
  void initState() {
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    final isRunning = ref.watch(pomodoroTimerProvider).isRunning; 
    final shortBreak = ref.watch(pomodoroSettingsProvider).shortBreak;

    debugPrint("screen short break : $shortBreak");
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pomodoro'),
        ),
        body: Padding(
          padding: homePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PomodoroTimerWidget(),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: isRunning == false ? () {
                    ref.read(pomodoroTimerProvider.notifier).startTimer(); 
                  } : () {
                    ref.read(pomodoroTimerProvider.notifier).pauseTimer();
                  }
                  
                  , child: isRunning ? Text('Pause') : Text('Start')) ,
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

              
            ],
          ),
        ));
  }
}
