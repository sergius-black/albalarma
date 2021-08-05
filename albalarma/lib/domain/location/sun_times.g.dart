// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sun_times.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SunTimesAdapter extends TypeAdapter<_$_SunTimes> {
  @override
  final int typeId = 0;

  @override
  _$_SunTimes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_SunTimes(
      sunrise: fields[0] as DateTime,
      sunset: fields[1] as DateTime,
      solarNoon: fields[2] as DateTime,
      astronomicalTwilightBegin: fields[3] as DateTime,
      astronomicalTwilightEnd: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$_SunTimes obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.sunrise)
      ..writeByte(1)
      ..write(obj.sunset)
      ..writeByte(2)
      ..write(obj.solarNoon)
      ..writeByte(3)
      ..write(obj.astronomicalTwilightBegin)
      ..writeByte(4)
      ..write(obj.astronomicalTwilightEnd);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SunTimesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
