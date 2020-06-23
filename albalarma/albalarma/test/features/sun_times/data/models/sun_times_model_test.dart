import 'dart:convert';

import 'package:albalarma/features/sun_times/data/models/sun_times_model.dart';
import 'package:albalarma/features/sun_times/domain/entities/sun_times.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/fixtures/fixture_reader.dart';

void main() {
  final tSunTimesModel = SunTimesModel(
      sunRise: 'test sun rise string', sunSet: "test sun set string");

  test('Should be subclass of SunTimes entity', () async {
    // arrange

    // act

    // assert
    expect(tSunTimesModel, isA<SunTimes>());
  });

  test('Should return a valid model with the received JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture("suntimes.json"));
    // act
    final result = SunTimesModel.fromJson(jsonMap);
    // assert
    expect(result, tSunTimesModel);
  });
}
