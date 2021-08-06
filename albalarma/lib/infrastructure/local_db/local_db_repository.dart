import 'package:albalarma/domain/alarm/alarm.dart';
import 'package:albalarma/domain/location/location.dart';
import 'package:albalarma/domain/location/sun_times.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class LocalDatabase {
  late Box _sunTimesBox;
  late Box _locationBox;
  late Box _alarmBox;
  late SharedPreferences _sharedPreferences;

  //Constructor

  LocalDatabase() {
    Hive.initFlutter().then((_) {
      Hive.registerAdapter(SunTimesAdapter());
      Hive.registerAdapter(LocationAdapter());
      Hive.registerAdapter(AlarmAdapter());
      Hive.openBox<SunTimes>('suntimes').then((box) => _sunTimesBox = box);
      Hive.openBox<Location>('location').then((box) => _locationBox = box);
      Hive.openBox<Alarm>('alarm').then((box) => _alarmBox = box);
    });

    SharedPreferences.getInstance().then((prefs) => _sharedPreferences = prefs);
  }

  //Hive Methods

  Future<void> saveLocation(Location location) {
    return _locationBox.put("lastLocation", location);
  }

  Location? getLastLocation() {
    return _locationBox.get("lastLocation");
  }

  Future<void> saveAlarm(Alarm alarm) {
    return _alarmBox.put("currentAlarm", alarm);
  }

  Alarm? getCurrentAlarm() {
    return _alarmBox.get("currentAlarm");
  }

  SunTimes? getDateSunTimes(DateTime date, String locality) {
    final String dateAndLocation =
        "${date.year}-${date.month}-${date.day}-$locality";

    return _sunTimesBox.get(dateAndLocation);
  }

  Future<SunTimes> getTodaySuntimes() async {
    DateTime today = DateTime.now();
    String locationName = await getCurrentLocationName();

    final String dateAndLocation =
        "${today.year}-${today.month}-${today.day}-$locationName";

    return _sunTimesBox.get(dateAndLocation);
  }

  Future<SunTimes> getTomorrowSuntimes() async {
    DateTime tomorrow = DateTime.now().add(Duration(days: 1));
    String locationName = await getCurrentLocationName();

    final String dateAndLocation =
        "${tomorrow.year}-${tomorrow.month}-${tomorrow.day}-$locationName";

    return _sunTimesBox.get(dateAndLocation);
  }

  Future<void> addDateSunTimes(
      DateTime date, String locationName, SunTimes sunTimes) async {
    final String dateAndLocation =
        "${date.year}-${date.month}-${date.day}-$locationName";

    _sunTimesBox.put(dateAndLocation, sunTimes);
  }

  void close() {
    // Hive.close();
  }

// Shared Preferences Methods

  Future<bool> setOrchestratorStatus(bool onOrOff) async {
    return await _sharedPreferences.setBool("orchestratorStatus", onOrOff);
  }

  Future<bool> getOrchestratorStatus() async {
    return _sharedPreferences.getBool("orchestratorStatus") ?? false;
  }

  Future<bool> setAlarmTimeString(String timeString) async {
    return await _sharedPreferences.setString("nextAlarmTime", timeString);
  }

  Future<String> getAlarmTimeString() async {
    String timeString = _sharedPreferences.getString("nextAlarmTime") ??
        "Alarm string save error";

    return timeString;
  }

  Future<bool> setAlarmId(int alarmId) async {
    return await _sharedPreferences.setInt("alarmId", alarmId);
  }

  Future<int> getAlarmId() async {
    return _sharedPreferences.getInt("alarmId") ?? 0;
  }

  Future<bool> setOrchestratorId(int orchestratorId) async {
    return await _sharedPreferences.setInt("orchestratorId", orchestratorId);
  }

  Future<int> getOrchestratorId() async {
    return _sharedPreferences.getInt("orchestratorId") ?? 1;
  }

  Future<bool> setAlarmTime(DateTime alarmTime) async {
    return _sharedPreferences.setInt(
        "alarmTime", alarmTime.millisecondsSinceEpoch);
  }

  Future<DateTime> getAlarmTime() async {
    int? timeInt = _sharedPreferences.getInt("alarmTime");
    return DateTime.fromMillisecondsSinceEpoch(timeInt ?? 0);
  }

  Future<bool> setCurrentLocationName(String location) async {
    return await _sharedPreferences.setString("currentLocation", location);
  }

  Future<String> getCurrentLocationName() async {
    return _sharedPreferences.getString("currentLocation") ?? "ERROOROROOROROR";
  }

  Future<bool> setWeekendNoAlarm(bool weekend) async {
    return await _sharedPreferences.setBool("weekend", weekend);
  }

  Future<bool> getWeekendNoAlarm() async {
    return _sharedPreferences.getBool("weekend") ?? false;
  }

  Future<bool> setAlarmOffset(int offset) async {
    return await _sharedPreferences.setInt("offset", offset);
  }

  Future<int> getAlarmOffset() async {
    return _sharedPreferences.getInt("offset") ?? 0;
  }
}
