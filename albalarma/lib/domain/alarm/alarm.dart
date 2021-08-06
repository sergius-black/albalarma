import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'alarm.freezed.dart';
part 'alarm.g.dart';

@freezed
abstract class Alarm with _$Alarm {
  @HiveType(typeId: 2, adapterName: "AlarmAdapter")
  const factory Alarm({
    @HiveField(0) required DateTime? alarmTime,
    @HiveField(1) required String radio,
  }) = _Alarm;

  factory Alarm.empty() => Alarm(
        alarmTime: null,
        radio: "BioBio",
      );
}
