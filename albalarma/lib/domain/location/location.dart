import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:albalarma/domain/location/sun_times.dart';

part 'location.freezed.dart';

@freezed
abstract class Location with _$Location {
  const factory Location({
    required String name,
    required double latitude,
    required double longitude,
    List<SunTimes>? sunTimes,
  }) = _Location;

  factory Location.pichilemu() => Location(
        name: "Pichilemu",
        latitude: -34.398907,
        longitude: -72.013892,
      );
}
