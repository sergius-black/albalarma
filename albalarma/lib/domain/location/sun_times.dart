import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'sun_times.freezed.dart';
part 'sun_times.g.dart';

@freezed
abstract class SunTimes with _$SunTimes {
  @HiveType(typeId: 0, adapterName: "SunTimesAdapter")
  const factory SunTimes({
    @HiveField(0) required DateTime sunrise,
    @HiveField(1) required DateTime sunset,
    @HiveField(2) required DateTime solarNoon,
    @HiveField(3) required DateTime astronomicalTwilightBegin,
    @HiveField(4) required DateTime astronomicalTwilightEnd,
  }) = _SunTimes;

  factory SunTimes.empty() => SunTimes(
        sunrise: DateTime.now(),
        sunset: DateTime.now(),
        solarNoon: DateTime.now(),
        astronomicalTwilightBegin: DateTime.now(),
        astronomicalTwilightEnd: DateTime.now(),
      );
}
