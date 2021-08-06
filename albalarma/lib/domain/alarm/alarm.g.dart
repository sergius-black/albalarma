// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlarmAdapter extends TypeAdapter<_$_Alarm> {
  @override
  final int typeId = 2;

  @override
  _$_Alarm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Alarm(
      alarmTime: fields[0] as DateTime?,
      radio: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Alarm obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.alarmTime)
      ..writeByte(1)
      ..write(obj.radio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
