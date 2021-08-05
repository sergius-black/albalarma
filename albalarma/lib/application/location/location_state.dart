part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = LocationInitial;
  const factory LocationState.requesting() = RequestingLocation;
  const factory LocationState.loaded(Location location) = LocationLoaded;
  const factory LocationState.error(String error, Location location) =
      LocationError;
}
