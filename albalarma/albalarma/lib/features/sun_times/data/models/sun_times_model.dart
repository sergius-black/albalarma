import 'package:albalarma/features/sun_times/domain/entities/sun_times.dart';
import 'package:meta/meta.dart';

class SunTimesModel extends SunTimes {
  SunTimesModel({
    @required String sunRise,
    @required String sunSet,
  });

  @override
  List<Object> get props => [sunRise, sunSet];

  factory SunTimesModel.fromJson(Map<String, dynamic> json) {
    return SunTimesModel(
      sunRise: json['sunrise'],
      sunSet: json["sunset"],
    );
  }
}
