import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SunTimes extends Equatable {
  final String sunRise;
  final String sunSet;

  SunTimes({
    @required this.sunRise,
    @required this.sunSet,
  });
  @override
  List<Object> get props => [sunRise, sunSet];
}
