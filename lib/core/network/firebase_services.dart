import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseServices {
  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    debugPrint('Handling a background message ');
    await Firebase.initializeApp();
  }

  Future<void> intializeFirebase() async {
    final firebaseToken = await FirebaseMessaging.instance.getToken();
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('firebase_token', firebaseToken.toString());
    debugPrint(firebaseToken);
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.max);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  ////////////////////////////////////////////////////////////////////////
  Future<void> getinitialMessage() async {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null && !kIsWeb) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    icon: '@mipmap/ic_launcher', importance: Importance.high),
              ));
        }

        var data = message.data;
        debugPrint(data.toString());
        debugPrint("firebase data ----------------------------- : $data");
      }
    });
  }

  //////////////////////////////////////////////////////////////////////////
  Future<void> getonMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  icon: '@mipmap/ic_launcher', importance: Importance.high),
            ));
      }

      var data = message.data;
      debugPrint(data.toString());

      debugPrint("firebase data ----------------------------- : $data");
    });
  }
  ////////////////////////////////////////////////////////////////

  Future<void> getonMessageOpenedApp() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  icon: '@mipmap/ic_launcher', importance: Importance.high),
            ));
      }
      debugPrint('A new onMessageOpenedApp event was published!');
      // var val;
      var data = message.data;
      debugPrint(data.toString());
    });
  }
}
