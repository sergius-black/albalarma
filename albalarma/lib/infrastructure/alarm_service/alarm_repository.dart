import 'dart:async';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';
import 'package:albalarma/dependency_injection/injection.dart';
import 'package:albalarma/domain/alarm/alarm.dart';
import 'package:albalarma/domain/location/sun_times.dart';
import 'package:albalarma/infrastructure/alarm_service/inspiration.dart';
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

  // LocalDatabase _db = getIt<LocalDatabase>();

  DateTime now() => DateTime.now();

  bool isAfter9PM() => now().isAfter(DateTime.parse(
      "${now().year}-${now().month.toString().padLeft(2, '0')}-${now().day.toString().padLeft(2, '0')} 21:00:00"));

  bool isWeekend() =>
      (now().weekday == 5 && isAfter9PM()) ||
      now().weekday == 6 ||
      (now().weekday == 7 && !isAfter9PM());

  Future<bool> isNightBefore() async =>
      ((await getIt<LocalDatabase>().nextSunrise()).day == now().day);

  void _alarmOrchestrator() async {
    LocalDatabase _db = getIt<LocalDatabase>();

    // DateTime currentAlarmTime = await _db.getAlarmTime();

    bool alarmStatus = await _db.getAlarmStatus();

    // check if its between friday 20:00 and sunday 20:00 so no alarm triggers in weekends

    bool lazyWeekend = await _db.getLazyWeekend();

    // lazy weekends with no alarm
    if (isWeekend() && lazyWeekend) {
      _showNotification("no alarm weekend");
      return;
    }
    // albalarma idle times. During the day
    if (!isAfter9PM() && !(await isNightBefore())) {
      _showNotification("idle");
      return;
    }
    // time to set on the alarm. its after 9pm or before that days sunrise in case this triggers
    // after midnight and no alarm was set

    if ((isAfter9PM() && (alarmStatus == false))) {
      setAlarm((await _db.nextSunrise())
          .add(Duration(minutes: await _db.getAlarmOffset())));
      _showNotification("alarm just set");

      return;
    }

    _showNotification();
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
    await getIt<LocalDatabase>().setAlarmStatus(false);
    // getIt<AudioHandler>().customAction(_alarmRadio);
  }

  void _showNotification([String? type]) async {
    String alarmTimeString = await getIt<LocalDatabase>().getAlarmTimeString();

    String notificationTitle = 'Albalarma Activada';
    String notificationBody = 'a las $alarmTimeString';
    String bigText = "big text";

    if (type == "no alarm weekend") {
      Map<String, String> fraseInspiradora = Inspiration.getInspired();

      notificationTitle = "Fin de semana flojo!";
      notificationBody =
          "Para pensar: ${fraseInspiradora.keys.first} dijo: ${fraseInspiradora.values.first}";
      bigText =
          "Para pensar: ${fraseInspiradora.keys.first} dijo: ${fraseInspiradora.values.first}";
    }

    if (type == "idle") {
      Map<String, String> fraseInspiradora = Inspiration.getInspired();

      notificationTitle = "Sabias palabras de ${fraseInspiradora.keys.first}:";
      bigText = "Sabias palabras de ${fraseInspiradora.keys.first}:";
      notificationBody = fraseInspiradora.values.first;
    }

    if (type == "alarm just set") {
      notificationTitle = "Albalarma Activada";
      notificationBody = "Recien puesta la alarma para mañana";
    }

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'Alarm time notification Id',
      'Alarm time Notification Channel',
      'Display next alarm time',
      importance: Importance.low,
      priority: Priority.low,
      autoCancel: false,
      playSound: false,
      styleInformation: BigTextStyleInformation(bigText),
      visibility: NotificationVisibility.public,
    );

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        0, notificationTitle, notificationBody, notificationDetails);
  }

  Future<bool> setOrchestrator() async {
    LocalDatabase _db = getIt<LocalDatabase>();
    print(isAfter9PM());
    print(await (_db.getAlarmStatus()));
    try {
      int currentAlarmId = await _db.getAlarmId();
      AndroidAlarmManager.cancel(currentAlarmId);

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
        await _db.setOrchestratorId(orchestratorId);
        await _db.setAlarmOffset(timeOffset);
      }
      return didSetOrchestrator;
    } catch (err) {
      print(err);
    }
    return false;
  }

  Future<bool> setAlarm(DateTime alarmTime) async {
    LocalDatabase _db = getIt<LocalDatabase>();
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
        await _db.setAlarmId(alarmId);
        await _db.setAlarmTimeString(getTimeString(alarmTime));
        await _db.setAlarmTime(alarmTime);
        await _db.setAlarmStatus(true);
      }

      return (didSetAlarm);
    } catch (err) {
      print(err);
    }
    return false;
  }

  Future<bool> setEnsayo() async {
    LocalDatabase _db = getIt<LocalDatabase>();

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
      print("ensayo orchestrator: $didSetOrchestrator");

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

      print("ensayo alarm: $didSetAlarm");

      if (didSetAlarm && didSetOrchestrator) {
        await _db.setAlarmId(alarmId);
        await _db.setOrchestratorId(orchestratorId);
        await _db.setAlarmTimeString(getTimeString(alarmTime));
        await _db.setAlarmTime(alarmTime);
        await _db.setAlarmStatus(true);
        await _db.setOrchestratorStatus(true);
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
    LocalDatabase _db = getIt<LocalDatabase>();
    int orchestratorId = await _db.getOrchestratorId();
    int alarmId = await _db.getAlarmId();
    await _db.setAlarmStatus(false);
    await _db.setOrchestratorStatus(false);

    bool cancelOrchestrator = await AndroidAlarmManager.cancel(orchestratorId);
    bool cancelAlarm = await AndroidAlarmManager.cancel(alarmId);
    print("cancelled alarms $orchestratorId and $alarmId");

    return (cancelOrchestrator && cancelAlarm);
  }

  Future<bool> cancelOrchestrator() async {
    LocalDatabase _db = getIt<LocalDatabase>();

    int orchestratorId = await _db.getOrchestratorId();
    bool cancelOrchestrator = await AndroidAlarmManager.cancel(orchestratorId);
    await _db.setOrchestratorStatus(false);
    print("cancelled orchestrator");
    return (cancelOrchestrator);
  }

  String getTimeString(DateTime date) {
    final int timezone = DateTime.now().timeZoneOffset.inHours;
    return "${date.hour + timezone}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}";
  }
}
