import 'package:albalarma/domain/location/sun_times.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RemoteAPI {
  late Dio dio;
  RemoteAPI() {
    final options = BaseOptions(baseUrl: "https://api.sunrise-sunset.org");
    dio = Dio(options);
  }

  Future<SunTimes> getSunTimesFromAPI({
    String? date,
    required String latitude,
    required String longitude,
  }) async {
    SunTimes sunTimes = SunTimes.empty();
    try {
      var response = await dio.get("/json", queryParameters: {
        "formatted": 0,
        "lat": latitude,
        "lng": longitude,
        "date": date ?? "today"
      });

      sunTimes = SunTimes(
        sunrise: DateTime.parse(response.data["results"]["sunrise"]),
        sunset: DateTime.parse(response.data["results"]["sunset"]),
        solarNoon: DateTime.parse(response.data["results"]["solar_noon"]),
        astronomicalTwilightBegin: DateTime.parse(
            response.data["results"]["astronomical_twilight_begin"]),
        astronomicalTwilightEnd: DateTime.parse(
            response.data["results"]["astronomical_twilight_end"]),
      );
      print("remote suntimes");
      print(sunTimes);
    } catch (e) {
      print(e);
    }
    return sunTimes;
  }
}
