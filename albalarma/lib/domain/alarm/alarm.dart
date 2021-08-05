import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm.freezed.dart';

@freezed
abstract class Alarm with _$Alarm {
  const factory Alarm({required DateTime alarmTime, required String radio}) =
      _Alarm;

  factory Alarm.initial() => Alarm(
        alarmTime: DateTime.now(),
        radio: "Futuro",
      );
}
