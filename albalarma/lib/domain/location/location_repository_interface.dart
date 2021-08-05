import 'package:albalarma/domain/location/location.dart';

abstract class ILocationRepository {
  Future<Location> getCurrentLocationSuntimes();
}
