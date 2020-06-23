import 'package:albalarma/features/sun_times/domain/entities/sun_times.dart';
import 'package:albalarma/features/sun_times/domain/repositories/sun_time_repository.dart';
import 'package:albalarma/features/sun_times/domain/usecases/get_local_sun_times.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSunTimesRepository extends Mock implements SunTimeRepository {}

void main() {
  GetLocalSunTimes usecase;
  MockSunTimesRepository mockSunTimesRepository;

  setUp(() {
    mockSunTimesRepository = MockSunTimesRepository();
    usecase = GetLocalSunTimes(mockSunTimesRepository);
  });

  final tlat = -33.411664;
  final tlng = -70.583496;
  final tSunTime = SunTimes(sunRise: "11:39:31 AM", sunSet: "9:41:52 PM");

  test("should get sun times for mock location", () async {
    //arrange
    when(mockSunTimesRepository.getSunTime(any, any))
        .thenAnswer((_) async => Right(tSunTime));
    // act
    final result = await usecase(Params(lat: tlat, lng: tlng));
    //assert
    expect(result, Right(tSunTime));
    verify(mockSunTimesRepository.getSunTime(tlat, tlng));
    verifyNoMoreInteractions(mockSunTimesRepository);
  });
}
