import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_week_demo/configuration/injection.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart' as flutter_local_notifications;
class NotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future initialize() async =>
      await _flutterLocalNotificationsPlugin.initialize(
          const InitializationSettings(
              android: AndroidInitializationSettings('@mipmap/ic_launcher')));




  static Future showNotification(RemoteMessage message) async {
    // information to creating the channel 'soft'
    try {
      AndroidNotificationDetails androidDetails =
          const AndroidNotificationDetails(
        "soft",
        "soft",
        "this is out channel",
        enableLights: true,
        enableVibration: true,
        priority: Priority.high,
        importance: Importance.max,
        styleInformation: MediaStyleInformation(
          htmlFormatContent: true,
          htmlFormatTitle: true,
        ),
        playSound: true,
      );

      await _flutterLocalNotificationsPlugin.show(
          message.data.hashCode,
          message.notification!.title,
          message.notification!.body,
          NotificationDetails(
            android: androidDetails,
          ));
    } on Exception catch (e) {
      getIt.get<Logger>().d(e);
      // TODO
    }
  }
}
