import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MCTLocalNotification {
  static final MCTLocalNotification _singleton =
      MCTLocalNotification._internal();

  factory MCTLocalNotification() {
    return _singleton;
  }

  MCTLocalNotification._internal();

  static const String NOTIFICATION_CHANEL_ID = "multiple_countdown_timer";
  static const int FOREGROUND_SERVICE_NOTIFICATION_ID = 98073067;
  static const String NOTIFICATION_CHANEL_TITLE =
      "Multiple Countdown Timer Service";
  static const String INITIAL_NOTIFICATION_TITLE = 'AWESOME SERVICE';
  static const String INITIAL_NOTIFICATION_CONTENT = 'Initializing';

  Future<void> initializeService() async {
    /// OPTIONAL, using custom notification channel id
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      NOTIFICATION_CHANEL_ID, // id
      NOTIFICATION_CHANEL_TITLE, // title
      description:
          'This channel is used for important notifications in $NOTIFICATION_CHANEL_TITLE.',
      // description
      importance: Importance.defaultImportance, // importance must be at low or higher level
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> show(
    String? title,
    String? body,
  ) async {
    /// OPTIONAL when use custom notification
    /// Es un singleton, asi que no afecta llamarlo cada vez
    return FlutterLocalNotificationsPlugin().show(
      FOREGROUND_SERVICE_NOTIFICATION_ID,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          NOTIFICATION_CHANEL_ID,
          NOTIFICATION_CHANEL_TITLE,
          icon: 'ic_bg_service_small',
          ongoing: true,
        ),
      ),
    );
  }
}
