import 'package:auto_route/auto_route.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:project_management_app/constants/string_constants.dart';
import 'package:project_management_app/main.dart';
import 'package:project_management_app/router/app_router.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('timer_channel', 'Timer Notifications',
          importance: Importance.low,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
          onlyAlertOnce: true,
          ongoing: true,
          showWhen: false);

  DarwinNotificationDetails iOSPlatformChannelSpecifics =
      DarwinNotificationDetails(
    presentAlert: true, // Display an alert
    presentSound: false, // Disable sound
    presentBadge: false, // Disable badge
    subtitle: 'Timer Notification', // Optional subtitle
  );

  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            defaultPresentAlert: true, // Display an alert
            defaultPresentSound: false, // Disable sound
            defaultPresentBadge: false);
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.payload != null) {
          appRouter.pushNamed(details.payload!);
        }
      },
    );
  }

  void cancelNotification(int notificationId) {
    flutterLocalNotificationsPlugin.cancel(notificationId);
  }
}
