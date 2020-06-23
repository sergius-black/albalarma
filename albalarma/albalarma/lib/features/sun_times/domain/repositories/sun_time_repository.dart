import 'package:albalarma/core/error/failures.dart';
import 'package:albalarma/features/sun_times/domain/entities/sun_times.dart';
import 'package:dartz/dartz.dart';

abstract class SunTimeRepository {
  Future<Either<Failure, SunTimes>> getSunTime(double lat, double lng);
  Future<Either<Failure, SunTimes>> getSantiagoSunTime();
}
