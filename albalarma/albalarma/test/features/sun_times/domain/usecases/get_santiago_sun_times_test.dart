import 'package:albalarma/core/usecases/usecase.dart';
import 'package:albalarma/features/sun_times/domain/entities/sun_times.dart';
import 'package:albalarma/features/sun_times/domain/repositories/sun_time_repository.dart';
import 'package:albalarma/features/sun_times/domain/usecases/get_santiago_sun_times.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSunTimesRepository extends Mock implements SunTimeRepository {}

void main() {
  GetSantiagoSunTimes usecase;
  MockSunTimesRepository mockSunTimesRepository;

  setUp(() {
    mockSunTimesRepository = MockSunTimesRepository();
    usecase = GetSantiagoSunTimes(mockSunTimesRepository);
  });

  final tlat = -33.411664;
  final tlng = -70.583496;
  final tSunTime = SunTimes(sunRise: "5:36:34 AM", sunSet: "03:45:52 PM");

  test("should get sun times for mock Santiago", () async {
    //arrange
    when(mockSunTimesRepository.getSantiagoSunTime())
        .thenAnswer((_) async => Right(tSunTime));
    // act
    final result = await usecase(NoParams());
    //assert
    expect(result, Right(tSunTime));
    verify(mockSunTimesRepository.getSantiagoSunTime());
    verifyNoMoreInteractions(mockSunTimesRepository);
  });
}
