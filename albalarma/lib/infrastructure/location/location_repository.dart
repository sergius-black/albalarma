import 'package:albalarma/dependency_injection/injection.dart';
import 'package:albalarma/domain/location/location.dart';
import 'package:albalarma/domain/location/location_repository_interface.dart';
import 'package:albalarma/domain/location/sun_times.dart';
import 'package:albalarma/infrastructure/local_db/local_db_repository.dart';
import 'package:albalarma/infrastructure/remote_api/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:injectable/injectable.dart';

@Singleton()
class LocationRepository implements ILocationRepository {
  final LocalDatabase _db = getIt<LocalDatabase>();
  final RemoteAPI _api = getIt<RemoteAPI>();

  Future<PositionName> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final Position position = await Geolocator.getCurrentPosition();
    final String name = (await placemarkFromCoordinates(
                position.latitude, position.longitude))[0]
            .locality ??
        "Unknown";

    await _db.setCurrentLocationName(name);

    return PositionName(position, name);
  }

  @override
  Future<Location> getCurrentLocationSuntimes() async {
    late Location location;

    try {
      PositionName _positionName = await determinePosition();
      print(_positionName);
      DateTime today = DateTime.now();
      // List<Placemark> _placemarks = await placemarkFromCoordinates(
      //     _position.latitude, _position.longitude);

      print(_positionName.name);

      List<SunTimes> suntimes = [];

      for (var day = 0; day < 7; day++) {
        DateTime requestDay = today.add(Duration(days: day));

        final sunTimesFromLocalDB =
            _db.getDateSunTimes(requestDay, _positionName.name);
        // if (sunTimesFromLocalDB != null) {
        //   print("local suntimes");
        //   print(sunTimesFromLocalDB);
        // }
        if (sunTimesFromLocalDB == null) {
          // print("Requesting suntimes for $dateAndLocation");
          SunTimes sunTimesFromRemoteAPI = await _api.getSunTimesFromAPI(
            latitude: _positionName.position.latitude.toString(),
            longitude: _positionName.position.longitude.toString(),
            date: "${requestDay.year}-${requestDay.month}-${requestDay.day}",
          );

          _db.addDateSunTimes(
              requestDay, _positionName.name, sunTimesFromRemoteAPI);
          suntimes.add(sunTimesFromRemoteAPI);
        } else
          suntimes.add(sunTimesFromLocalDB);
      }

      location = Location(
        name: _positionName.name,
        latitude: _positionName.position.latitude,
        longitude: _positionName.position.longitude,
        sunTimes: suntimes,
      );
    } catch (err) {
      print(err);
    }
    return location;
  }

  Future<Location> getPichilemuSuntimes() async {
    Location location = Location.pichilemu();
    try {
      DateTime today = DateTime.now();

      List<SunTimes> suntimes = [];

      for (var day = 0; day < 7; day++) {
        DateTime requestDay = today.add(Duration(days: day));

        final sunTimesFromLocalDB =
            _db.getDateSunTimes(requestDay, "Pichilemu");

        if (sunTimesFromLocalDB == null) {
          SunTimes sunTimesFromRemoteAPI = await _api.getSunTimesFromAPI(
            latitude: location.latitude.toString(),
            longitude: location.longitude.toString(),
            date: "${requestDay.year}-${requestDay.month}-${requestDay.day}",
          );

          _db.addDateSunTimes(requestDay, "Pichilemu", sunTimesFromRemoteAPI);
          suntimes.add(sunTimesFromRemoteAPI);
        } else
          suntimes.add(sunTimesFromLocalDB);
      }

      location = location.copyWith(sunTimes: suntimes);
    } catch (err) {
      print(err);
    }
    return location;
  }

  Future<Location> reFetchSuntimes(Location location) async {
    DateTime today = DateTime.now();

    List<SunTimes> suntimes = [];

    for (var day = 0; day < 7; day++) {
      DateTime requestDay = today.add(Duration(days: day));

      final String dateAndLocation =
          "${requestDay.year}-${requestDay.month}-${requestDay.day}-${location.name}";

      print("Requesting suntimes for $dateAndLocation");

      SunTimes sunTimesFromRemoteAPI = await _api.getSunTimesFromAPI(
        latitude: location.latitude.toString(),
        longitude: location.longitude.toString(),
        date: "${requestDay.year}-${requestDay.month}-${requestDay.day}",
      );

      _db.addDateSunTimes(requestDay, location.name, sunTimesFromRemoteAPI);
      suntimes.add(sunTimesFromRemoteAPI);
    }
    location = location.copyWith(sunTimes: suntimes);
    return location;
  }
}

class PositionName {
  Position position;
  String name;

  PositionName(this.position, this.name);
}
