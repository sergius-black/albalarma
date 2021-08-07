part of 'alarm_cubit.dart';

@freezed
class AlarmState with _$AlarmState {
  const factory AlarmState.initial() = AlarmInitial;
  const factory AlarmState.off(Alarm alarm, int initialOffset) = Off;
  const factory AlarmState.setting() = SettingAlarm;
  const factory AlarmState.setted(
          Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend) =
      AlarmSet;
  const factory AlarmState.error() = AlarmError;
}
