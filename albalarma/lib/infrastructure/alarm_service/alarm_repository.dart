import 'dart:async';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';
import 'package:albalarma/dependency_injection/injection.dart';
import 'package:albalarma/domain/alarm/alarm.dart';
import 'package:albalarma/domain/location/sun_times.dart';
import 'package:albalarma/infrastructure/local_db/local_db_repository.dart';
import 'package:flutter/material.dart';

import 'package:audio_service/audio_service.dart';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
// import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
const String albalarmaIsolate = "albalarma";
final ReceivePort receivePort = ReceivePort();

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

@Singleton()
class AlarmRepository {
  //initial contructor method setup and isolate port registration
  AlarmRepository() {
    AndroidAlarmManager.initialize();

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
    });
    IsolateNameServer.removePortNameMapping(albalarmaIsolate);
    bool didRegisterIsolate = IsolateNameServer.registerPortWithName(
      receivePort.sendPort,
      albalarmaIsolate,
    );
    print("registration was $didRegisterIsolate");
    receivePort.listen((message) {
      print(message);
      if (message == "rise and shine") {
        _triggerAlarm();
        _playRadio();
      }

      if (message == "orchestrator") {
        _alarmOrchestrator();
      }
    });
    print("Alarm repository init");
  }

  int _offset = 0;
  DateTime _sunrise = DateTime.now();
  String _alarmRadio = "Futuro";

  Alarm get alarm {
    return Alarm(alarmTime: alarmTime, radio: _alarmRadio);
  }

  int get timeOffset {
    return _offset;
  }

  DateTime get alarmTime {
    return _sunrise.add(Duration(minutes: timeOffset));
  }

  set setSunriseTime(DateTime sunrise) {
    _sunrise = sunrise;
  }

  set setAlarmOffset(int offset) {
    int timeOffset = ((offset - 12) * 5);
    _offset = timeOffset;
  }

  set setRadio(String radio) {
    _alarmRadio = radio;
  }

  void _playRadio() {
    getIt<AudioHandler>().customAction(_alarmRadio);
  }

  void _alarmOrchestrator() async {
    // bool albalarmaStatus = await getIt<LocalDatabase>().getAlbalarmaStatus();
    int timeOffset = await getIt<LocalDatabase>().getAlarmOffset();

    DateTime now = DateTime.now();

    DateTime currentAlarmTime = await getIt<LocalDatabase>().getAlarmTime();

    SunTimes todaySunTimes = await getIt<LocalDatabase>().getTodaySuntimes();

    SunTimes tomorrowSunTimes =
        await getIt<LocalDatabase>().getTomorrowSuntimes();

    bool isAfter8PM = now.isAfter(DateTime.parse(
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} 20:00:00"));

    // check if its between friday 20:00 and sunday 20:00 so no alarm triggers in weekends
    bool isWeekend = (now.weekday == 5 && isAfter8PM) ||
        now.weekday == 6 ||
        (now.weekday == 7 && !isAfter8PM);

    bool weekendNoAlarm = await getIt<LocalDatabase>().getWeekendNoAlarm();

    bool isWakeUpTime = now.isAfter(currentAlarmTime) &&
        now.isBefore(currentAlarmTime.add(Duration(hours: 1)));

    bool isAlarmIdleTime =
        now.isAfter(currentAlarmTime.add(Duration(hours: 1))) && !isAfter8PM;

    bool isAlarmSetTime = isAfter8PM || now.isBefore(todaySunTimes.sunrise);

    bool alarmSetForToday = currentAlarmTime.isAfter(now);

    // lazy weekends with no alarm
    if (isWeekend && weekendNoAlarm) {
      _showAlarmTimeNotification("no alarm weekend");
      return;
    }
    // albalarma idle times. During the day
    if (isAlarmIdleTime) {
      _showAlarmTimeNotification("idle");
      return;
    }
    // between alarm time and 1 hour after it
    if (isWakeUpTime) {
      _showAlarmTimeNotification("wake up time");
      return;
    }
    // time to set on the alarm. its after 8pm or before that days sunrise in case this triggers
    // after midnight and no alarm was set

    if (isAlarmSetTime && !alarmSetForToday) {
      DateTime nextSunrise = now.isBefore(todaySunTimes.sunrise)
          ? todaySunTimes.sunrise
          : tomorrowSunTimes.sunrise;

      setAlarm(nextSunrise.add(Duration(minutes: timeOffset)));
      _showAlarmTimeNotification("alarm just set");

      return;
    }

    _showAlarmTimeNotification();
  }

  void _triggerAlarm() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'Albalarma Id',
      'Albalarma Channel',
      'Rise and shine Mr. Freeman',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('gallo'),
      fullScreenIntent: true,
      importance: Importance.max,
      priority: Priority.max,
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        0, 'Albalarma Activada', 'DESPIERTA MIERDA!', notificationDetails);

    // getIt<AudioHandler>().customAction(_alarmRadio);
  }

  void _showAlarmTimeNotification([String? type]) async {
    String alarmTimeString = await getIt<LocalDatabase>().getAlarmTimeString();

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'Alarm time notification Id',
      'Alarm time Notification Channel',
      'Display next alarm time',
      importance: Importance.low,
      priority: Priority.low,
      autoCancel: false,
      playSound: false,
      visibility: NotificationVisibility.public,
    );
    String notificationTitle = 'Albalarma Activada';
    String notificationBody = 'a las $alarmTimeString';

    if (type == "no alarm weekend") {
      notificationTitle = "Fin de semana flojo";
      notificationBody = "Descansa y duerme mucho!";
    }

    if (type == "idle") {
      notificationTitle = "Albalarma idle";
      notificationBody = "Aprovecha el día!";
    }

    if (type == "wake up time") {
      notificationBody = "Levantate flojo!";
    }
    if (type == "alarm just set") {
      notificationTitle = "Albalarma Activada";
      notificationBody = "Recien puesta la alarma para mañana";
    }

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        0, notificationTitle, notificationBody, notificationDetails);
  }

  Future<bool> setOrchestrator() async {
    try {
      int orchestratorId = Random().nextInt(pow(2, 31).toInt());
      print("Setting orchestrator with id: $orchestratorId");
      bool didSetOrchestrator = await AndroidAlarmManager.periodic(
        Duration(minutes: 30),
        orchestratorId,
        orchestratorCallback,
        exact: true,
        wakeup: true,
        rescheduleOnReboot: true,
      );
      if (didSetOrchestrator) {
        await getIt<LocalDatabase>().setOrchestratorId(orchestratorId);
        await getIt<LocalDatabase>().setAlarmOffset(timeOffset);
      }
      return didSetOrchestrator;
    } catch (err) {
      print(err);
    }
    return false;
  }

  Future<bool> setAlarm(DateTime alarmTime) async {
    try {
      int alarmId = Random().nextInt(pow(2, 31).toInt());
      print("Setting alarm with id: $alarmId");
      bool didSetAlarm = await AndroidAlarmManager.oneShotAt(
        alarmTime,
        alarmId,
        alarmCallback,
        alarmClock: true,
        allowWhileIdle: true,
        exact: true,
        wakeup: true,
        rescheduleOnReboot: true,
      );

      if (didSetAlarm) {
        await getIt<LocalDatabase>().setAlarmId(alarmId);
        await getIt<LocalDatabase>()
            .setAlarmTimeString(getTimeString(alarmTime));
        await getIt<LocalDatabase>().setAlarmTime(alarmTime);
      }

      return (didSetAlarm);
    } catch (err) {
      print(err);
    }
    return false;
  }

  Future<bool> setEnsayo() async {
    print("ensayo en $timeOffset segundos");
    try {
      int orchestratorId = Random().nextInt(pow(2, 31).toInt());
      // int alarmId1 = 874173424;
      print("Setting notification alarm with id: $orchestratorId");
      bool didSetOrchestrator = await AndroidAlarmManager.periodic(
        Duration(seconds: 10),
        orchestratorId,
        orchestratorCallback,
        exact: true,
        wakeup: true,
      );

      int alarmId = Random().nextInt(pow(2, 31).toInt());

      print("Setting final alarm with id: $alarmId");
      bool didSetAlarm = await AndroidAlarmManager.oneShot(
        Duration(seconds: timeOffset),
        alarmId,
        alarmCallback,
        exact: true,
        wakeup: true,
        rescheduleOnReboot: true,
      );

      if (didSetAlarm && didSetOrchestrator) {
        await getIt<LocalDatabase>().setAlarmId(alarmId);
        await getIt<LocalDatabase>().setOrchestratorId(orchestratorId);
        await getIt<LocalDatabase>()
            .setAlarmTimeString(getTimeString(alarmTime));
        await getIt<LocalDatabase>().setAlarmTime(alarmTime);
      }

      return (didSetAlarm && didSetOrchestrator);
    } catch (err) {
      print(err);
    }
    return true;
  }

  static void orchestratorCallback() async {
    final SendPort? send = IsolateNameServer.lookupPortByName(albalarmaIsolate);
    send?.send("orchestrator");
  }

  static void alarmCallback() async {
    final SendPort? send = IsolateNameServer.lookupPortByName(albalarmaIsolate);
    send?.send("rise and shine");
  }

  Future<bool> cancelAll() async {
    int orchestratorId = await getIt<LocalDatabase>().getOrchestratorId();
    int alarmId = await getIt<LocalDatabase>().getAlarmId();

    bool cancelOrchestrator = await AndroidAlarmManager.cancel(orchestratorId);
    bool cancelAlarm = await AndroidAlarmManager.cancel(alarmId);
    print("cancelled alarms $orchestratorId and $alarmId");

    return (cancelOrchestrator && cancelAlarm);
  }

  Future<bool> cancelOrchestrator() async {
    int orchestratorId = await getIt<LocalDatabase>().getOrchestratorId();
    bool cancelOrchestrator = await AndroidAlarmManager.cancel(orchestratorId);
    print("cancelled orchestrator");
    return (cancelOrchestrator);
  }

  String getTimeString(DateTime date) {
    final int timezone = DateTime.now().timeZoneOffset.inHours;
    return "${date.hour + timezone}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}";
  }
}
