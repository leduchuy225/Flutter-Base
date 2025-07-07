import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/utils.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _localNotifications = FlutterLocalNotificationsPlugin();

  static Future<void> initializeFBMessaging(
    void Function(RemoteMessage) onPressNotificaiton,
  ) async {
    await NotificationService.setupLocalNotificationPlugin(
      onDidReceiveNotificationResponse: (notificaiton) {
        onPressNotificaiton(
          RemoteMessage.fromMap(convertStringToMap(notificaiton.payload)),
        );
      },
    );

    // Foreground message listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📬 Foreground message: ${message.notification?.title}');
      _showLocalNotification(message);
    });

    // App opened from background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('🟢 Notification tapped');
      onPressNotificaiton(message);
    });
  }

  static void navigateFromNotification(
    BuildContext context, {
    required RemoteMessage message,
  }) {}

  static Future<void> _showLocalNotification(RemoteMessage message) async {
    const androidDetails = AndroidNotificationDetails(
      'flutter_base_channel_id',
      'flutter_base_channel_name',
      // priority: Priority.high,
      // importance: Importance.max,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);
    final notification = message.notification;

    if (notification != null) {
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        notificationDetails,
        payload: jsonEncode(message.toMap()),
      );
    }
  }

  static Future<void> setupLocalNotificationPlugin({
    void Function(NotificationResponse)? onDidReceiveNotificationResponse,
  }) async {
    const initializationSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }
}
