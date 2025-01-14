import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

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

  AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'channel_id', // Channel ID
    'channel_name', // Channel name
    channelDescription: 'Your channel description',
    importance: Importance.high,
    priority: Priority.high,
    ticker: 'ticker',
  );

  Future<void> initialize() async {
    tz.initializeTimeZones();
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
    );
  }

  void cancelNotification(int notificationId) {
    flutterLocalNotificationsPlugin.cancel(notificationId);
  }

  void scheduleNotification(DateTime date, TimeOfDay time) async {
    final combinedDateTime = combineDateTime(date, time);

    // Convert DateTime to TZDateTime
    final tz.TZDateTime scheduledDate =
        tz.TZDateTime.from(combinedDateTime, tz.local);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Scheduled Notification',
      'This notification is based on DateTime and TimeOfDay.',
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your_channel_id',
          'your_channel_name',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  DateTime combineDateTime(DateTime date, TimeOfDay time) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  // Future<void> scheduleNotification() async {
  //   // Set the notification details

  //   NotificationDetails notificationDetails =
  //       NotificationDetails(android: androidNotificationDetails);

  //   // Create a time in the future for the notification (e.g., 10 seconds from now)
  //   final DateTime scheduledTime = DateTime.now().add(Duration(seconds: 10));

  //   // Schedule the notification
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     0, // Notification ID
  //     'Scheduled Notification',
  //     'This is a scheduled notification.',
  //     scheduledTime,
  //     notificationDetails,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.wallClockTime,
  //     matchDateTimeComponents: DateTimeComponents
  //         .time, androidScheduleMode: ,
  //   );
  // }
}
