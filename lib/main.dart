import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_management_app/router/app_router.dart';
import 'package:project_management_app/theme/app_theme.dart';
import 'package:flutter_background/flutter_background.dart';

import 'package:move_to_background/move_to_background.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterBackground.initialize();

  // NotificationService().initialize();

  runApp(const ProviderScope(child: MyApp()));
}

// void onDidReceiveNotificationResponse(
//     NotificationResponse notificationResponse) async {
//   final String? payload = notificationResponse.payload;
//   if (notificationResponse.payload != null) {
//     debugPrint('notification payload: $payload');
//   }
//   await Navigator.push(
//     context,
//     MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
//   );
// }

final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const platform = MethodChannel('android_app_retain');

    return PopScope(
      onPopInvokedWithResult: (bool x, dynamic y) async {
        MoveToBackground.moveTaskToBack();

        // if (Platform.isAndroid) {
        //   if (Navigator.of(context).canPop()) {
        //     return Future.value(true);
        //   } else {
        //     await platform.invokeMethod('sendToBackground');
        //     return Future.value(false);
        //   }
        // } else {
        //   return Future.value(true);
        // }
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: AppTextTheme.textTheme(AppColorSchemes.lightColorScheme),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
