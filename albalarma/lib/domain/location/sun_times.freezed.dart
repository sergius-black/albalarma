// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sun_times.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SunTimesTearOff {
  const _$SunTimesTearOff();

  _SunTimes call(
      {@HiveField(0) required DateTime sunrise,
      @HiveField(1) required DateTime sunset,
      @HiveField(2) required DateTime solarNoon,
      @HiveField(3) required DateTime astronomicalTwilightBegin,
      @HiveField(4) required DateTime astronomicalTwilightEnd}) {
    return _SunTimes(
      sunrise: sunrise,
      sunset: sunset,
      solarNoon: solarNoon,
      astronomicalTwilightBegin: astronomicalTwilightBegin,
      astronomicalTwilightEnd: astronomicalTwilightEnd,
    );
  }
}

/// @nodoc
const $SunTimes = _$SunTimesTearOff();

/// @nodoc
mixin _$SunTimes {
  @HiveField(0)
  DateTime get sunrise => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get sunset => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get solarNoon => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get astronomicalTwilightBegin => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get astronomicalTwilightEnd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SunTimesCopyWith<SunTimes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SunTimesCopyWith<$Res> {
  factory $SunTimesCopyWith(SunTimes value, $Res Function(SunTimes) then) =
      _$SunTimesCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) DateTime sunrise,
      @HiveField(1) DateTime sunset,
      @HiveField(2) DateTime solarNoon,
      @HiveField(3) DateTime astronomicalTwilightBegin,
      @HiveField(4) DateTime astronomicalTwilightEnd});
}

/// @nodoc
class _$SunTimesCopyWithImpl<$Res> implements $SunTimesCopyWith<$Res> {
  _$SunTimesCopyWithImpl(this._value, this._then);

  final SunTimes _value;
  // ignore: unused_field
  final $Res Function(SunTimes) _then;

  @override
  $Res call({
    Object? sunrise = freezed,
    Object? sunset = freezed,
    Object? solarNoon = freezed,
    Object? astronomicalTwilightBegin = freezed,
    Object? astronomicalTwilightEnd = freezed,
  }) {
    return _then(_value.copyWith(
      sunrise: sunrise == freezed
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sunset: sunset == freezed
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime,
      solarNoon: solarNoon == freezed
          ? _value.solarNoon
          : solarNoon // ignore: cast_nullable_to_non_nullable
              as DateTime,
      astronomicalTwilightBegin: astronomicalTwilightBegin == freezed
          ? _value.astronomicalTwilightBegin
          : astronomicalTwilightBegin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      astronomicalTwilightEnd: astronomicalTwilightEnd == freezed
          ? _value.astronomicalTwilightEnd
          : astronomicalTwilightEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$SunTimesCopyWith<$Res> implements $SunTimesCopyWith<$Res> {
  factory _$SunTimesCopyWith(_SunTimes value, $Res Function(_SunTimes) then) =
      __$SunTimesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) DateTime sunrise,
      @HiveField(1) DateTime sunset,
      @HiveField(2) DateTime solarNoon,
      @HiveField(3) DateTime astronomicalTwilightBegin,
      @HiveField(4) DateTime astronomicalTwilightEnd});
}

/// @nodoc
class __$SunTimesCopyWithImpl<$Res> extends _$SunTimesCopyWithImpl<$Res>
    implements _$SunTimesCopyWith<$Res> {
  __$SunTimesCopyWithImpl(_SunTimes _value, $Res Function(_SunTimes) _then)
      : super(_value, (v) => _then(v as _SunTimes));

  @override
  _SunTimes get _value => super._value as _SunTimes;

  @override
  $Res call({
    Object? sunrise = freezed,
    Object? sunset = freezed,
    Object? solarNoon = freezed,
    Object? astronomicalTwilightBegin = freezed,
    Object? astronomicalTwilightEnd = freezed,
  }) {
    return _then(_SunTimes(
      sunrise: sunrise == freezed
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sunset: sunset == freezed
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime,
      solarNoon: solarNoon == freezed
          ? _value.solarNoon
          : solarNoon // ignore: cast_nullable_to_non_nullable
              as DateTime,
      astronomicalTwilightBegin: astronomicalTwilightBegin == freezed
          ? _value.astronomicalTwilightBegin
          : astronomicalTwilightBegin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      astronomicalTwilightEnd: astronomicalTwilightEnd == freezed
          ? _value.astronomicalTwilightEnd
          : astronomicalTwilightEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0, adapterName: "SunTimesAdapter")
class _$_SunTimes implements _SunTimes {
  const _$_SunTimes(
      {@HiveField(0) required this.sunrise,
      @HiveField(1) required this.sunset,
      @HiveField(2) required this.solarNoon,
      @HiveField(3) required this.astronomicalTwilightBegin,
      @HiveField(4) required this.astronomicalTwilightEnd});

  @override
  @HiveField(0)
  final DateTime sunrise;
  @override
  @HiveField(1)
  final DateTime sunset;
  @override
  @HiveField(2)
  final DateTime solarNoon;
  @override
  @HiveField(3)
  final DateTime astronomicalTwilightBegin;
  @override
  @HiveField(4)
  final DateTime astronomicalTwilightEnd;

  @override
  String toString() {
    return 'SunTimes(sunrise: $sunrise, sunset: $sunset, solarNoon: $solarNoon, astronomicalTwilightBegin: $astronomicalTwilightBegin, astronomicalTwilightEnd: $astronomicalTwilightEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SunTimes &&
            (identical(other.sunrise, sunrise) ||
                const DeepCollectionEquality()
                    .equals(other.sunrise, sunrise)) &&
            (identical(other.sunset, sunset) ||
                const DeepCollectionEquality().equals(other.sunset, sunset)) &&
            (identical(other.solarNoon, solarNoon) ||
                const DeepCollectionEquality()
                    .equals(other.solarNoon, solarNoon)) &&
            (identical(other.astronomicalTwilightBegin,
                    astronomicalTwilightBegin) ||
                const DeepCollectionEquality().equals(
                    other.astronomicalTwilightBegin,
                    astronomicalTwilightBegin)) &&
            (identical(
                    other.astronomicalTwilightEnd, astronomicalTwilightEnd) ||
                const DeepCollectionEquality().equals(
                    other.astronomicalTwilightEnd, astronomicalTwilightEnd)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sunrise) ^
      const DeepCollectionEquality().hash(sunset) ^
      const DeepCollectionEquality().hash(solarNoon) ^
      const DeepCollectionEquality().hash(astronomicalTwilightBegin) ^
      const DeepCollectionEquality().hash(astronomicalTwilightEnd);

  @JsonKey(ignore: true)
  @override
  _$SunTimesCopyWith<_SunTimes> get copyWith =>
      __$SunTimesCopyWithImpl<_SunTimes>(this, _$identity);
}

abstract class _SunTimes implements SunTimes {
  const factory _SunTimes(
      {@HiveField(0) required DateTime sunrise,
      @HiveField(1) required DateTime sunset,
      @HiveField(2) required DateTime solarNoon,
      @HiveField(3) required DateTime astronomicalTwilightBegin,
      @HiveField(4) required DateTime astronomicalTwilightEnd}) = _$_SunTimes;

  @override
  @HiveField(0)
  DateTime get sunrise => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  DateTime get sunset => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  DateTime get solarNoon => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  DateTime get astronomicalTwilightBegin => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  DateTime get astronomicalTwilightEnd => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SunTimesCopyWith<_SunTimes> get copyWith =>
      throw _privateConstructorUsedError;
}
