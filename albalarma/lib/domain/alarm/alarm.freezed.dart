// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'alarm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlarmTearOff {
  const _$AlarmTearOff();

  _Alarm call(
      {@HiveField(0) required DateTime? alarmTime,
      @HiveField(1) required String radio}) {
    return _Alarm(
      alarmTime: alarmTime,
      radio: radio,
    );
  }
}

/// @nodoc
const $Alarm = _$AlarmTearOff();

/// @nodoc
mixin _$Alarm {
  @HiveField(0)
  DateTime? get alarmTime => throw _privateConstructorUsedError;
  @HiveField(1)
  String get radio => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmCopyWith<Alarm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmCopyWith<$Res> {
  factory $AlarmCopyWith(Alarm value, $Res Function(Alarm) then) =
      _$AlarmCopyWithImpl<$Res>;
  $Res call({@HiveField(0) DateTime? alarmTime, @HiveField(1) String radio});
}

/// @nodoc
class _$AlarmCopyWithImpl<$Res> implements $AlarmCopyWith<$Res> {
  _$AlarmCopyWithImpl(this._value, this._then);

  final Alarm _value;
  // ignore: unused_field
  final $Res Function(Alarm) _then;

  @override
  $Res call({
    Object? alarmTime = freezed,
    Object? radio = freezed,
  }) {
    return _then(_value.copyWith(
      alarmTime: alarmTime == freezed
          ? _value.alarmTime
          : alarmTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      radio: radio == freezed
          ? _value.radio
          : radio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AlarmCopyWith<$Res> implements $AlarmCopyWith<$Res> {
  factory _$AlarmCopyWith(_Alarm value, $Res Function(_Alarm) then) =
      __$AlarmCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) DateTime? alarmTime, @HiveField(1) String radio});
}

/// @nodoc
class __$AlarmCopyWithImpl<$Res> extends _$AlarmCopyWithImpl<$Res>
    implements _$AlarmCopyWith<$Res> {
  __$AlarmCopyWithImpl(_Alarm _value, $Res Function(_Alarm) _then)
      : super(_value, (v) => _then(v as _Alarm));

  @override
  _Alarm get _value => super._value as _Alarm;

  @override
  $Res call({
    Object? alarmTime = freezed,
    Object? radio = freezed,
  }) {
    return _then(_Alarm(
      alarmTime: alarmTime == freezed
          ? _value.alarmTime
          : alarmTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      radio: radio == freezed
          ? _value.radio
          : radio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 2, adapterName: "AlarmAdapter")
class _$_Alarm implements _Alarm {
  const _$_Alarm(
      {@HiveField(0) required this.alarmTime,
      @HiveField(1) required this.radio});

  @override
  @HiveField(0)
  final DateTime? alarmTime;
  @override
  @HiveField(1)
  final String radio;

  @override
  String toString() {
    return 'Alarm(alarmTime: $alarmTime, radio: $radio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Alarm &&
            (identical(other.alarmTime, alarmTime) ||
                const DeepCollectionEquality()
                    .equals(other.alarmTime, alarmTime)) &&
            (identical(other.radio, radio) ||
                const DeepCollectionEquality().equals(other.radio, radio)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(alarmTime) ^
      const DeepCollectionEquality().hash(radio);

  @JsonKey(ignore: true)
  @override
  _$AlarmCopyWith<_Alarm> get copyWith =>
      __$AlarmCopyWithImpl<_Alarm>(this, _$identity);
}

abstract class _Alarm implements Alarm {
  const factory _Alarm(
      {@HiveField(0) required DateTime? alarmTime,
      @HiveField(1) required String radio}) = _$_Alarm;

  @override
  @HiveField(0)
  DateTime? get alarmTime => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get radio => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AlarmCopyWith<_Alarm> get copyWith => throw _privateConstructorUsedError;
}
