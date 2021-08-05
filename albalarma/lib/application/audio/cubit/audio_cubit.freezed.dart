// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'audio_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AudioStateTearOff {
  const _$AudioStateTearOff();

  AudioInitial initial() {
    return const AudioInitial();
  }

  Idle idle() {
    return const Idle();
  }

  Loading loading() {
    return const Loading();
  }

  Playing playing() {
    return const Playing();
  }

  Paused paused() {
    return const Paused();
  }

  Error error() {
    return const Error();
  }
}

/// @nodoc
const $AudioState = _$AudioStateTearOff();

/// @nodoc
mixin _$AudioState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() playing,
    required TResult Function() paused,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? paused,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AudioInitial value) initial,
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(Playing value) playing,
    required TResult Function(Paused value) paused,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AudioInitial value)? initial,
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Playing value)? playing,
    TResult Function(Paused value)? paused,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioStateCopyWith<$Res> {
  factory $AudioStateCopyWith(
          AudioState value, $Res Function(AudioState) then) =
      _$AudioStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AudioStateCopyWithImpl<$Res> implements $AudioStateCopyWith<$Res> {
  _$AudioStateCopyWithImpl(this._value, this._then);

  final AudioState _value;
  // ignore: unused_field
  final $Res Function(AudioState) _then;
}

/// @nodoc
abstract class $AudioInitialCopyWith<$Res> {
  factory $AudioInitialCopyWith(
          AudioInitial value, $Res Function(AudioInitial) then) =
      _$AudioInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$AudioInitialCopyWithImpl<$Res> extends _$AudioStateCopyWithImpl<$Res>
    implements $AudioInitialCopyWith<$Res> {
  _$AudioInitialCopyWithImpl(
      AudioInitial _value, $Res Function(AudioInitial) _then)
      : super(_value, (v) => _then(v as AudioInitial));

  @override
  AudioInitial get _value => super._value as AudioInitial;
}

/// @nodoc

class _$AudioInitial implements AudioInitial {
  const _$AudioInitial();

  @override
  String toString() {
    return 'AudioState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AudioInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() playing,
    required TResult Function() paused,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? paused,
    TResult Function()? error,
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
    required TResult Function(AudioInitial value) initial,
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(Playing value) playing,
    required TResult Function(Paused value) paused,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AudioInitial value)? initial,
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Playing value)? playing,
    TResult Function(Paused value)? paused,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AudioInitial implements AudioState {
  const factory AudioInitial() = _$AudioInitial;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$AudioStateCopyWithImpl<$Res>
    implements $IdleCopyWith<$Res> {
  _$IdleCopyWithImpl(Idle _value, $Res Function(Idle) _then)
      : super(_value, (v) => _then(v as Idle));

  @override
  Idle get _value => super._value as Idle;
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'AudioState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() playing,
    required TResult Function() paused,
    required TResult Function() error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? paused,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AudioInitial value) initial,
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(Playing value) playing,
    required TResult Function(Paused value) paused,
    required TResult Function(Error value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AudioInitial value)? initial,
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Playing value)? playing,
    TResult Function(Paused value)? paused,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements AudioState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$AudioStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'AudioState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() playing,
    required TResult Function() paused,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? paused,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AudioInitial value) initial,
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(Playing value) playing,
    required TResult Function(Paused value) paused,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AudioInitial value)? initial,
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Playing value)? playing,
    TResult Function(Paused value)? paused,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements AudioState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $PlayingCopyWith<$Res> {
  factory $PlayingCopyWith(Playing value, $Res Function(Playing) then) =
      _$PlayingCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlayingCopyWithImpl<$Res> extends _$AudioStateCopyWithImpl<$Res>
    implements $PlayingCopyWith<$Res> {
  _$PlayingCopyWithImpl(Playing _value, $Res Function(Playing) _then)
      : super(_value, (v) => _then(v as Playing));

  @override
  Playing get _value => super._value as Playing;
}

/// @nodoc

class _$Playing implements Playing {
  const _$Playing();

  @override
  String toString() {
    return 'AudioState.playing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Playing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() playing,
    required TResult Function() paused,
    required TResult Function() error,
  }) {
    return playing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? paused,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AudioInitial value) initial,
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(Playing value) playing,
    required TResult Function(Paused value) paused,
    required TResult Function(Error value) error,
  }) {
    return playing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AudioInitial value)? initial,
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Playing value)? playing,
    TResult Function(Paused value)? paused,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(this);
    }
    return orElse();
  }
}

abstract class Playing implements AudioState {
  const factory Playing() = _$Playing;
}

/// @nodoc
abstract class $PausedCopyWith<$Res> {
  factory $PausedCopyWith(Paused value, $Res Function(Paused) then) =
      _$PausedCopyWithImpl<$Res>;
}

/// @nodoc
class _$PausedCopyWithImpl<$Res> extends _$AudioStateCopyWithImpl<$Res>
    implements $PausedCopyWith<$Res> {
  _$PausedCopyWithImpl(Paused _value, $Res Function(Paused) _then)
      : super(_value, (v) => _then(v as Paused));

  @override
  Paused get _value => super._value as Paused;
}

/// @nodoc

class _$Paused implements Paused {
  const _$Paused();

  @override
  String toString() {
    return 'AudioState.paused()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Paused);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() playing,
    required TResult Function() paused,
    required TResult Function() error,
  }) {
    return paused();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? paused,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AudioInitial value) initial,
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(Playing value) playing,
    required TResult Function(Paused value) paused,
    required TResult Function(Error value) error,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AudioInitial value)? initial,
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Playing value)? playing,
    TResult Function(Paused value)? paused,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class Paused implements AudioState {
  const factory Paused() = _$Paused;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$AudioStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;
}

/// @nodoc

class _$Error implements Error {
  const _$Error();

  @override
  String toString() {
    return 'AudioState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() playing,
    required TResult Function() paused,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? paused,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AudioInitial value) initial,
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(Playing value) playing,
    required TResult Function(Paused value) paused,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AudioInitial value)? initial,
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Playing value)? playing,
    TResult Function(Paused value)? paused,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AudioState {
  const factory Error() = _$Error;
}
