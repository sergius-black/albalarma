// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocationTearOff {
  const _$LocationTearOff();

  _Location call(
      {@HiveField(0) required String name,
      @HiveField(1) required double latitude,
      @HiveField(2) required double longitude,
      @HiveField(3) List<SunTimes>? sunTimes}) {
    return _Location(
      name: name,
      latitude: latitude,
      longitude: longitude,
      sunTimes: sunTimes,
    );
  }
}

/// @nodoc
const $Location = _$LocationTearOff();

/// @nodoc
mixin _$Location {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  double get latitude => throw _privateConstructorUsedError;
  @HiveField(2)
  double get longitude => throw _privateConstructorUsedError;
  @HiveField(3)
  List<SunTimes>? get sunTimes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) double latitude,
      @HiveField(2) double longitude,
      @HiveField(3) List<SunTimes>? sunTimes});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? sunTimes = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      sunTimes: sunTimes == freezed
          ? _value.sunTimes
          : sunTimes // ignore: cast_nullable_to_non_nullable
              as List<SunTimes>?,
    ));
  }
}

/// @nodoc
abstract class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) double latitude,
      @HiveField(2) double longitude,
      @HiveField(3) List<SunTimes>? sunTimes});
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(_Location _value, $Res Function(_Location) _then)
      : super(_value, (v) => _then(v as _Location));

  @override
  _Location get _value => super._value as _Location;

  @override
  $Res call({
    Object? name = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? sunTimes = freezed,
  }) {
    return _then(_Location(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      sunTimes: sunTimes == freezed
          ? _value.sunTimes
          : sunTimes // ignore: cast_nullable_to_non_nullable
              as List<SunTimes>?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: "LocationAdapter")
class _$_Location implements _Location {
  const _$_Location(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.latitude,
      @HiveField(2) required this.longitude,
      @HiveField(3) this.sunTimes});

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final double latitude;
  @override
  @HiveField(2)
  final double longitude;
  @override
  @HiveField(3)
  final List<SunTimes>? sunTimes;

  @override
  String toString() {
    return 'Location(name: $name, latitude: $latitude, longitude: $longitude, sunTimes: $sunTimes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Location &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.sunTimes, sunTimes) ||
                const DeepCollectionEquality()
                    .equals(other.sunTimes, sunTimes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(sunTimes);

  @JsonKey(ignore: true)
  @override
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);
}

abstract class _Location implements Location {
  const factory _Location(
      {@HiveField(0) required String name,
      @HiveField(1) required double latitude,
      @HiveField(2) required double longitude,
      @HiveField(3) List<SunTimes>? sunTimes}) = _$_Location;

  @override
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  double get latitude => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  double get longitude => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  List<SunTimes>? get sunTimes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocationCopyWith<_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
