import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/utils.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../widgets/dialog/dialog_widget.dart';
import 'user_service.dart';

class NotificationService {
  static late StreamSubscription<RemoteMessage> messageSubscription;
  static late StreamSubscription<RemoteMessage> messageOpenedAppSubscription;

  static final _localNotifications = FlutterLocalNotificationsPlugin();

  static Future<void> handleFirebaseMessaging(BuildContext context) async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      await NotificationService.navigateFromNotification(
        context,
        message: initialMessage,
      );
    }

    // App opened from background
    messageOpenedAppSubscription = FirebaseMessaging.onMessageOpenedApp.listen((
      RemoteMessage message,
    ) async {
      print('Notification tapped');
      await NotificationService.navigateFromNotification(
        context,
        message: message,
      );
    });
  }

  static Future<void> initializeLocalNotification(BuildContext context) async {
    await NotificationService.setupLocalNotificationPlugin(
      onDidReceiveNotificationResponse: (notificaiton) async {
        await NotificationService.navigateFromNotification(
          context,
          message: RemoteMessage.fromMap(
            convertStringToMap(notificaiton.payload),
          ),
        );
      },
    );

    // Foreground message listener
    messageSubscription = FirebaseMessaging.onMessage.listen((
      RemoteMessage message,
    ) {
      print('Foreground message: ${message.notification?.title}');
      _showLocalNotification(message);
    });
  }

  static void cancel() {
    messageSubscription.cancel();
    messageOpenedAppSubscription.cancel();
  }

  static Future navigateFromNotification(
    BuildContext context, {
    required RemoteMessage message,
  }) async {
    final accessToken = await UserService.accessToken;
    if (accessToken.isEmpty) {
      return;
    }

    MyDialog.snackbar(
      message.notification?.body ?? '',
      title: message.notification?.title ?? '',
      type: SnackbarType.INFORMATION,
    );

    // Handle navigation here
    // Get.to(() => const DevScreen());
  }

  static Future<void> _showLocalNotification(RemoteMessage message) async {
    const androidDetails = AndroidNotificationDetails(
      'flutter_base_channel_id',
      'flutter_base_channel_name',
      // priority: Priority.high,
      // importance: Importance.max,
    );
    const iosDetails = DarwinNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
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
      '@mipmap/launcher_icon',
    );

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }
}
