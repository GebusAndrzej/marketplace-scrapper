import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _singleton = NotificationService._internal();

  var initializationSettingsAndroid = const AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );

  late InitializationSettings initializationSettings;
  var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  factory NotificationService() {
    return _singleton;
  }

  NotificationService._internal() {
    initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: inspect,
      onDidReceiveNotificationResponse: inspect,
    );
  }

  Future showNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'Channel id', 'ChannelName',
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority);

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Notification Alert 🔔',
      'Message - There is a new notification on your account, kindly check it out',
      platformChannelSpecifics,
      payload:
          'Message - There is a new notification on your account, kindly check it out',
    );
  }
}
