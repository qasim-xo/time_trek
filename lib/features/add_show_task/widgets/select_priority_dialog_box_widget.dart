// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class SelectPriorityDialogBoxWidget extends ConsumerWidget {
//   const SelectPriorityDialogBoxWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return AlertDialog(
//       title: const Text('Select Focus Sound'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           RadioListTile(
//               title: const Text('Birds Chirping'),
//               value: 1,
//               groupValue: selectedRadioButton,
//               onChanged: (int? value) {
//                 ref
//                     .read(pomodoroSettingsProvider.notifier)
//                     .setSelectedRadioButton(value!);
//               }),
//           RadioListTile(
//               title: const Text('Clock ticking'),
//               value: 2,
//               groupValue: selectedRadioButton,
//               onChanged: (int? value) {
//                 ref
//                     .read(pomodoroSettingsProvider.notifier)
//                     .setSelectedRadioButton(value!);
//               }),
//           RadioListTile(
//               title: const Text('Fire Cracking'),
//               value: 3,
//               groupValue: selectedRadioButton,
//               onChanged: (int? value) {
//                 ref
//                     .read(pomodoroSettingsProvider.notifier)
//                     .setSelectedRadioButton(value!);
//               }),
//           RadioListTile(
//               title: const Text('Keyboard Typing'),
//               value: 4,
//               groupValue: selectedRadioButton,
//               onChanged: (int? value) {
//                 ref
//                     .read(pomodoroSettingsProvider.notifier)
//                     .setSelectedRadioButton(value!);
//               }),
//           RadioListTile(
//               title: const Text('Rain sounds'),
//               value: 5,
//               groupValue: selectedRadioButton,
//               onChanged: (int? value) {
//                 ref
//                     .read(pomodoroSettingsProvider.notifier)
//                     .setSelectedRadioButton(value!);
//               }),
//           RadioListTile(
//               title: const Text('White Sound'),
//               value: 6,
//               groupValue: selectedRadioButton,
//               onChanged: (int? value) {
//                 ref
//                     .read(pomodoroSettingsProvider.notifier)
//                     .setSelectedRadioButton(value!);
//               }),
//         ],
//       ),
//     );
//   }
// }
