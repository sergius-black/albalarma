import 'package:albalarma/core/error/failures.dart';
import 'package:albalarma/core/usecases/usecase.dart';
import 'package:albalarma/features/sun_times/domain/entities/sun_times.dart';
import 'package:albalarma/features/sun_times/domain/repositories/sun_time_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetLocalSunTimes implements UseCase<SunTimes, Params> {
  final SunTimeRepository repository;

  GetLocalSunTimes(this.repository);

  @override
  Future<Either<Failure, SunTimes>> call(Params params) async {
    return await repository.getSunTime(params.lat, params.lng);
  }
}

class Params extends Equatable {
  final double lat;
  final double lng;

  Params({@required this.lat, @required this.lng});

  @override
  List<Object> get props => [lat, lng];
}
