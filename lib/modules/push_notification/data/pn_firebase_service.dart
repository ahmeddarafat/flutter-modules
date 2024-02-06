import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// top-level method
Future<void> handleMessage(RemoteMessage? message) async {
  log("outside message");
  if (message != null) {
    log("inside message");
    log("title: ${message.notification?.title ?? "Unkown"}");
    log("body: ${message.notification?.body ?? "Unkown"}");
    log("data: ${message.data}");
  }

  /// here you can emit state that there methods come & rebuild the view
}

class PNFirebaseService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  /// create android channel
  final _androidChannel = const AndroidNotificationChannel(
    "high_important_channel",
    "Notification Channel",
  );

  /// And add this in AndroidManifest.xml
  
  // <meta-data
  //     android:name = "com.google.firebase.messaging.default_notification_channel_id"
  //     android:value = "high_important_channel"/>

  final _localNotification = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();

    /// Sets the presentation options for Apple notifications when received in the foreground.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    /// change every installation
    final fCMToken = await _firebaseMessaging.getToken();
    log("Token : ${fCMToken ?? "null"}");

    initLocalNotification();
    initPushNotification();
  }

  void initPushNotification() {
    /// It's called when the app is in the background or terminated.
    /// onBackgroundMesssage must has top-level method (outside of class) as a parameter
    FirebaseMessaging.onBackgroundMessage(handleMessage);

    /// It's called when a user presses a notification message displayed via FCM.
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    /// It's called when an incoming FCM payload is received whilst the Flutter instance is in the foreground.
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          /// Notification details for Android.
          android: AndroidNotificationDetails(
            _androidChannel.id, _androidChannel.name,
            // priority: Priority.max,
            // importance: Importance.max

            /// Try icon image with asset file or drawable in android
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future<void> initLocalNotification() async {
    const iOS = DarwinInitializationSettings();
    // android\app\src\main\res\drawable\ic_launcher.png
    const android = AndroidInitializationSettings('modules');
    const settings = InitializationSettings(
      android: android,
      iOS: iOS,
    );

    /// Call this method on application before using the plugin further.
    _localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: (notificationResponse) {
        final payload = notificationResponse.payload;
        if (payload != null) {
          final message = RemoteMessage.fromMap(jsonDecode(payload));
          handleMessage(message);
        }
      },
    );

    final platform = _localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }
}
