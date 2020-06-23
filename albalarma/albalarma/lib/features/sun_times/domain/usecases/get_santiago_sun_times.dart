import 'package:albalarma/core/error/failures.dart';
import 'package:albalarma/core/usecases/usecase.dart';
import 'package:albalarma/features/sun_times/domain/entities/sun_times.dart';
import 'package:albalarma/features/sun_times/domain/repositories/sun_time_repository.dart';
import 'package:dartz/dartz.dart';

class GetSantiagoSunTimes implements UseCase<SunTimes, NoParams> {
  final SunTimeRepository repository;

  GetSantiagoSunTimes(this.repository);

  @override
  Future<Either<Failure, SunTimes>> call(NoParams params) async {
    return await repository.getSantiagoSunTime();
  }
}
