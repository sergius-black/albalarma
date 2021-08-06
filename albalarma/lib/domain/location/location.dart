import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:albalarma/domain/location/sun_times.dart';
import 'package:hive/hive.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
abstract class Location with _$Location {
  @HiveType(typeId: 1, adapterName: "LocationAdapter")
  const factory Location({
    @HiveField(0) required String name,
    @HiveField(1) required double latitude,
    @HiveField(2) required double longitude,
    @HiveField(3) List<SunTimes>? sunTimes,
  }) = _Location;

  factory Location.pichilemu() => Location(
        name: "Pichilemu",
        latitude: -34.398907,
        longitude: -72.013892,
      );
}
