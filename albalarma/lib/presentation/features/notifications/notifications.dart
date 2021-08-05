import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:albalarma/dependency_injection/injection.dart';
import 'package:albalarma/infrastructure/location/location_repository.dart';
import 'package:audio_service/audio_service.dart';
import "package:flutter/material.dart";

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
const String albalarmaIsolate = "albalarma";
final ReceivePort port = ReceivePort();

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final LocationRepository locationRepository = LocationRepository();
  final String countKey = 'count';
  late SharedPreferences prefs;

  final AudioHandler _audioHandler = getIt<AudioHandler>();

  static void _callback() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name with sound',
      'your channel description',
      // ongoing: true,
      // autoCancel: false,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('gallo'),
      fullScreenIntent: true,
      // category: "CATEGORY_ALARM",

      // timeoutAfter: 10000,
      importance: Importance.max,
      priority: Priority.max,
      // ticker: 'ticker',
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin
        .show(0, 'Hello', 'wasap', notificationDetails, payload: 'item x');

    final int isolateId = Isolate.current.hashCode;
    print("from _callback isolate=$isolateId");
    final SendPort? send = IsolateNameServer.lookupPortByName(albalarmaIsolate);
    send?.send("asdf");
    // _audioHandler.customAction("futuro");
  }

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      albalarmaIsolate,
    );

    // AndroidAlarmManager.initialize();
    port.listen((_) => logIsolate());
  }

  void logIsolate() {
    final int isolateId = Isolate.current.hashCode;
    print("from logIsolate isolate=$isolateId");

    _audioHandler.customAction('futuro');
  }

  void _setAlarm() async {
    final int isolateId = Isolate.current.hashCode;
    print("from _setAlarm isolate=$isolateId");

    int alarmId = Random().nextInt(pow(2, 31).toInt());
    DateTime time = DateTime.now().add(Duration(seconds: 10));
    print(time);
    print("Setting alarm with id: $alarmId");
    // await AndroidAlarmManager.initialize();
    bool wathappen = await AndroidAlarmManager.oneShotAt(
      time,
      // Ensure we have a unique alarm ID.
      alarmId,
      _callback,
      exact: true,
      wakeup: true,
    );
    print(wathappen);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _setAlarm,
              child: Text("set alarm"),
            ),
            ElevatedButton(
              onPressed: logIsolate,
              child: Text("set notification"),
            ),
            ElevatedButton(
                onPressed: () => _audioHandler.stop(), child: Icon(Icons.stop))
          ],
        ),
      ),
    );
  }
}
