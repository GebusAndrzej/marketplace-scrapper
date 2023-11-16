import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationTest extends StatefulWidget {
  @override
  State<NotificationTest> createState() => _NotificationTest();
}

class _NotificationTest extends State<NotificationTest> {
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  late InitializationSettings initializationSettings;
  var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  _NotificationTest() {
    initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: inspect,
      onDidReceiveNotificationResponse: inspect,
    );
  }

  Future _showNotification() async {
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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showNotification();
      },
      child: Text("Send notification"),
    );
  }
}
