import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class MCTForegroundService {
  static final MCTForegroundService _singleton =
      MCTForegroundService._internal();

  factory MCTForegroundService() {
    return _singleton;
  }

  MCTForegroundService._internal();

  Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    /*
    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
          iOS: IOSInitializationSettings(),
        ),
      );
    }
    */

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // this will be executed when app is in foreground or background in separated isolate
        onStart: onStart,

        // auto start service
        autoStart: true,
        autoStartOnBoot: true,
        isForegroundMode: true,

        notificationChannelId: MCTLocalNotification.NOTIFICATION_CHANEL_ID,
        foregroundServiceNotificationId:
            MCTLocalNotification.FOREGROUND_SERVICE_NOTIFICATION_ID,
        //estos raramente se usan
        initialNotificationTitle:
            MCTLocalNotification.INITIAL_NOTIFICATION_TITLE,
        initialNotificationContent:
            MCTLocalNotification.INITIAL_NOTIFICATION_CONTENT,
      ),
      iosConfiguration: IosConfiguration(
        // auto start service
        autoStart: true,

        // this will be executed when app is in foreground in separated isolate
        onForeground: onStart,

        // you have to enable background fetch capability on xcode project
        onBackground: onIosBackground,
      ),
    );

    service.startService();
  }

// to ensure this is executed
// run app from xcode, then from xcode menu, select Simulate Background Fetch

  @pragma('vm:entry-point')
  Future<bool> onIosBackground(ServiceInstance service) async {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();

    return true;
  }

  static const _setAsForegroundKey = "setAsForeground";
  static const _setAsBackgroundKey = "setAsBackground";
  static const _updateKey = "update";
  static const _stopServiceKey = "stopService";

  void setAsForegroundService() {
    FlutterBackgroundService().invoke(_setAsForegroundKey);
  }

  void setAsBackgroundService() {
    FlutterBackgroundService().invoke(_setAsBackgroundKey);
  }

  Stream<Map<String, dynamic>?> onUpdate() =>
      FlutterBackgroundService().on(_updateKey);

  Stream<Map<String, dynamic>?> on(String method) =>
      FlutterBackgroundService().on(method);

  Future<bool> isRunning() => FlutterBackgroundService().isRunning();

  Future<bool> startService() => FlutterBackgroundService().startService();

  void stopService() => FlutterBackgroundService().invoke(_stopServiceKey);

  @pragma('vm:entry-point')
  static void onStart(ServiceInstance service) async {
    // Only available for flutter 3.0.0 and later
    DartPluginRegistrant.ensureInitialized();

    // For flutter prior to version 3.0.0
    // We have to register the plugin manually

    if (service is AndroidServiceInstance) {
      service.on(_setAsForegroundKey).listen((event) {
        service.setAsForegroundService();
      });

      service.on(_setAsBackgroundKey).listen((event) {
        service.setAsBackgroundService();
      });
    }

    service.on(_stopServiceKey).listen((event) {
      service.stopSelf();
    });

    // bring to foreground
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          /// OPTIONAL for use custom notification
          /// the notification id must be equals with AndroidConfiguration when you call configure() method.
          MCTLocalNotification().show(
            'COOL SERVICE',
            'Awesome ${DateTime.now()}',
          );

          // if you don't using custom notification, uncomment this
          // service.setForegroundNotificationInfo(
          //   title: "My App Service",
          //   content: "Updated at ${DateTime.now()}",
          // );
        }
      }

      /// you can see this log in logcat
      print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

      // test using external plugin
      final deviceInfo = DeviceInfoPlugin();
      String? device;
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        device = androidInfo.model;
      }

      if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        device = iosInfo.model;
      }

      service.invoke(
        'update',
        {
          "current_date": DateTime.now().toIso8601String(),
          "device": device,
        },
      );
    });
  }
}
