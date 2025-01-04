import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/constants/extension_constants.dart';
import 'package:project_management_app/features/pomodoro/providers/pomodoro_settings_provider.dart';

class PomodoroSettingsSheetWidget extends ConsumerWidget {
  const PomodoroSettingsSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusSession = ref.watch(pomodoroSettingsProvider).focusSession;
    final shortBreak = ref.watch(pomodoroSettingsProvider).shortBreak;
    final longBreak = ref.watch(pomodoroSettingsProvider).longBreak;
    final longBreakInterval =
        ref.watch(pomodoroSettingsProvider).longBreakInterval;

    return Wrap(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Text(
                  "Settings",
                  style: context.textTheme.titleMedium?.copyWith(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Focus Session"),
                    Row(
                      children: [
                        IconButton(
                            onPressed: focusSession.inMinutes > 1
                                ? () {
                                    final newFocusSession = focusSession -
                                        const Duration(minutes: 1);
                                    ref
                                        .read(pomodoroSettingsProvider.notifier)
                                        .setFocusSession(newFocusSession);
                                  }
                                : null,
                            icon: const Icon(Icons.remove)),
                        Text("${focusSession.inMinutes} min"),
                        IconButton(
                            onPressed: () {
                              final newFocusSession =
                                  focusSession + const Duration(minutes: 1);
                              ref
                                  .read(pomodoroSettingsProvider.notifier)
                                  .setFocusSession(newFocusSession);
                            },
                            icon: const Icon(Icons.add))
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Short Break"),
                    Row(
                      children: [
                        IconButton(
                            onPressed: shortBreak.inMinutes > 1
                                ? () {
                                    final newShortBreak =
                                        shortBreak - const Duration(minutes: 1);
                                    ref
                                        .read(pomodoroSettingsProvider.notifier)
                                        .setShortBreak(newShortBreak);
                                  }
                                : null,
                            icon: const Icon(Icons.remove)),
                        Text("${shortBreak.inMinutes} min"),
                        IconButton(
                            onPressed: () {
                              final newShortBreak =
                                  shortBreak + const Duration(minutes: 1);
                              ref
                                  .read(pomodoroSettingsProvider.notifier)
                                  .setShortBreak(newShortBreak);
                            },
                            icon: const Icon(Icons.add))
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Long Break"),
                    Row(
                      children: [
                        IconButton(
                            onPressed: longBreak.inMinutes > 1
                                ? () {
                                    final newLongBreak =
                                        longBreak - const Duration(minutes: 1);
                                    ref
                                        .read(pomodoroSettingsProvider.notifier)
                                        .setLongBreak(newLongBreak);
                                  }
                                : null,
                            icon: const Icon(Icons.remove)),
                        Text("${longBreak.inMinutes} min"),
                        IconButton(
                            onPressed: () {
                              final newLongBreak =
                                  longBreak + const Duration(minutes: 1);
                              ref
                                  .read(pomodoroSettingsProvider.notifier)
                                  .setLongBreak(newLongBreak);
                            },
                            icon: const Icon(Icons.add))
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Long Break Interval"),
                    Row(
                      children: [
                        IconButton(
                            onPressed: longBreakInterval > 1
                                ? () {
                                    final newLongBreakInterval =
                                        longBreakInterval - 1;
                                    ref
                                        .read(pomodoroSettingsProvider.notifier)
                                        .setLongBreakInterval(
                                            newLongBreakInterval);
                                  }
                                : null,
                            icon: const Icon(Icons.remove)),
                        Text("$longBreakInterval"),
                        IconButton(
                            onPressed: () {
                              final newLongBreakInterval =
                                  longBreakInterval + 1;
                              ref
                                  .read(pomodoroSettingsProvider.notifier)
                                  .setLongBreakInterval(newLongBreakInterval);
                            },
                            icon: const Icon(Icons.add))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
