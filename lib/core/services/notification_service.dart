import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await notifications.initialize(settings: settings);

    await notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> showNotification(
    String title,
    String body,
  ) async {
    const NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        'therafy_channel',
        'Therafy Notifications',
        importance: Importance.high,
        priority: Priority.high,
      ),
    );

    await notifications.show(
      id: 0,
      title: title,
      body: body,
      notificationDetails: details,
    );
  }
}