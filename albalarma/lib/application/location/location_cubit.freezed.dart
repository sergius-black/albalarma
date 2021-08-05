// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'location_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocationStateTearOff {
  const _$LocationStateTearOff();

  LocationInitial initial() {
    return const LocationInitial();
  }

  RequestingLocation requesting() {
    return const RequestingLocation();
  }

  LocationLoaded loaded(Location location) {
    return LocationLoaded(
      location,
    );
  }

  LocationError error(String error, Location location) {
    return LocationError(
      error,
      location,
    );
  }
}

/// @nodoc
const $LocationState = _$LocationStateTearOff();

/// @nodoc
mixin _$LocationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requesting,
    required TResult Function(Location location) loaded,
    required TResult Function(String error, Location location) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requesting,
    TResult Function(Location location)? loaded,
    TResult Function(String error, Location location)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInitial value) initial,
    required TResult Function(RequestingLocation value) requesting,
    required TResult Function(LocationLoaded value) loaded,
    required TResult Function(LocationError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInitial value)? initial,
    TResult Function(RequestingLocation value)? requesting,
    TResult Function(LocationLoaded value)? loaded,
    TResult Function(LocationError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  final LocationState _value;
  // ignore: unused_field
  final $Res Function(LocationState) _then;
}

/// @nodoc
abstract class $LocationInitialCopyWith<$Res> {
  factory $LocationInitialCopyWith(
          LocationInitial value, $Res Function(LocationInitial) then) =
      _$LocationInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationInitialCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $LocationInitialCopyWith<$Res> {
  _$LocationInitialCopyWithImpl(
      LocationInitial _value, $Res Function(LocationInitial) _then)
      : super(_value, (v) => _then(v as LocationInitial));

  @override
  LocationInitial get _value => super._value as LocationInitial;
}

/// @nodoc

class _$LocationInitial implements LocationInitial {
  const _$LocationInitial();

  @override
  String toString() {
    return 'LocationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LocationInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requesting,
    required TResult Function(Location location) loaded,
    required TResult Function(String error, Location location) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requesting,
    TResult Function(Location location)? loaded,
    TResult Function(String error, Location location)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInitial value) initial,
    required TResult Function(RequestingLocation value) requesting,
    required TResult Function(LocationLoaded value) loaded,
    required TResult Function(LocationError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInitial value)? initial,
    TResult Function(RequestingLocation value)? requesting,
    TResult Function(LocationLoaded value)? loaded,
    TResult Function(LocationError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LocationInitial implements LocationState {
  const factory LocationInitial() = _$LocationInitial;
}

/// @nodoc
abstract class $RequestingLocationCopyWith<$Res> {
  factory $RequestingLocationCopyWith(
          RequestingLocation value, $Res Function(RequestingLocation) then) =
      _$RequestingLocationCopyWithImpl<$Res>;
}

/// @nodoc
class _$RequestingLocationCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $RequestingLocationCopyWith<$Res> {
  _$RequestingLocationCopyWithImpl(
      RequestingLocation _value, $Res Function(RequestingLocation) _then)
      : super(_value, (v) => _then(v as RequestingLocation));

  @override
  RequestingLocation get _value => super._value as RequestingLocation;
}

/// @nodoc

class _$RequestingLocation implements RequestingLocation {
  const _$RequestingLocation();

  @override
  String toString() {
    return 'LocationState.requesting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RequestingLocation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requesting,
    required TResult Function(Location location) loaded,
    required TResult Function(String error, Location location) error,
  }) {
    return requesting();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requesting,
    TResult Function(Location location)? loaded,
    TResult Function(String error, Location location)? error,
    required TResult orElse(),
  }) {
    if (requesting != null) {
      return requesting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInitial value) initial,
    required TResult Function(RequestingLocation value) requesting,
    required TResult Function(LocationLoaded value) loaded,
    required TResult Function(LocationError value) error,
  }) {
    return requesting(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInitial value)? initial,
    TResult Function(RequestingLocation value)? requesting,
    TResult Function(LocationLoaded value)? loaded,
    TResult Function(LocationError value)? error,
    required TResult orElse(),
  }) {
    if (requesting != null) {
      return requesting(this);
    }
    return orElse();
  }
}

abstract class RequestingLocation implements LocationState {
  const factory RequestingLocation() = _$RequestingLocation;
}

/// @nodoc
abstract class $LocationLoadedCopyWith<$Res> {
  factory $LocationLoadedCopyWith(
          LocationLoaded value, $Res Function(LocationLoaded) then) =
      _$LocationLoadedCopyWithImpl<$Res>;
  $Res call({Location location});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$LocationLoadedCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $LocationLoadedCopyWith<$Res> {
  _$LocationLoadedCopyWithImpl(
      LocationLoaded _value, $Res Function(LocationLoaded) _then)
      : super(_value, (v) => _then(v as LocationLoaded));

  @override
  LocationLoaded get _value => super._value as LocationLoaded;

  @override
  $Res call({
    Object? location = freezed,
  }) {
    return _then(LocationLoaded(
      location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ));
  }

  @override
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc

class _$LocationLoaded implements LocationLoaded {
  const _$LocationLoaded(this.location);

  @override
  final Location location;

  @override
  String toString() {
    return 'LocationState.loaded(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LocationLoaded &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @JsonKey(ignore: true)
  @override
  $LocationLoadedCopyWith<LocationLoaded> get copyWith =>
      _$LocationLoadedCopyWithImpl<LocationLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requesting,
    required TResult Function(Location location) loaded,
    required TResult Function(String error, Location location) error,
  }) {
    return loaded(location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requesting,
    TResult Function(Location location)? loaded,
    TResult Function(String error, Location location)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInitial value) initial,
    required TResult Function(RequestingLocation value) requesting,
    required TResult Function(LocationLoaded value) loaded,
    required TResult Function(LocationError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInitial value)? initial,
    TResult Function(RequestingLocation value)? requesting,
    TResult Function(LocationLoaded value)? loaded,
    TResult Function(LocationError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LocationLoaded implements LocationState {
  const factory LocationLoaded(Location location) = _$LocationLoaded;

  Location get location => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationLoadedCopyWith<LocationLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationErrorCopyWith<$Res> {
  factory $LocationErrorCopyWith(
          LocationError value, $Res Function(LocationError) then) =
      _$LocationErrorCopyWithImpl<$Res>;
  $Res call({String error, Location location});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$LocationErrorCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $LocationErrorCopyWith<$Res> {
  _$LocationErrorCopyWithImpl(
      LocationError _value, $Res Function(LocationError) _then)
      : super(_value, (v) => _then(v as LocationError));

  @override
  LocationError get _value => super._value as LocationError;

  @override
  $Res call({
    Object? error = freezed,
    Object? location = freezed,
  }) {
    return _then(LocationError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ));
  }

  @override
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc

class _$LocationError implements LocationError {
  const _$LocationError(this.error, this.location);

  @override
  final String error;
  @override
  final Location location;

  @override
  String toString() {
    return 'LocationState.error(error: $error, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LocationError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(location);

  @JsonKey(ignore: true)
  @override
  $LocationErrorCopyWith<LocationError> get copyWith =>
      _$LocationErrorCopyWithImpl<LocationError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requesting,
    required TResult Function(Location location) loaded,
    required TResult Function(String error, Location location) error,
  }) {
    return error(this.error, location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requesting,
    TResult Function(Location location)? loaded,
    TResult Function(String error, Location location)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInitial value) initial,
    required TResult Function(RequestingLocation value) requesting,
    required TResult Function(LocationLoaded value) loaded,
    required TResult Function(LocationError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInitial value)? initial,
    TResult Function(RequestingLocation value)? requesting,
    TResult Function(LocationLoaded value)? loaded,
    TResult Function(LocationError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LocationError implements LocationState {
  const factory LocationError(String error, Location location) =
      _$LocationError;

  String get error => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationErrorCopyWith<LocationError> get copyWith =>
      throw _privateConstructorUsedError;
}
