part of 'alarm_cubit.dart';

@freezed
class AlarmState with _$AlarmState {
  const factory AlarmState.initial() = AlarmInitial;
  const factory AlarmState.off(Alarm alarm) = Off;
  const factory AlarmState.setting() = SettingAlarm;
  const factory AlarmState.setted(Alarm alarm) = AlarmSet;
  const factory AlarmState.error() = AlarmError;
}
