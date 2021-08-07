// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'alarm_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlarmStateTearOff {
  const _$AlarmStateTearOff();

  AlarmInitial initial() {
    return const AlarmInitial();
  }

  Off off(Alarm alarm, int initialOffset) {
    return Off(
      alarm,
      initialOffset,
    );
  }

  SettingAlarm setting() {
    return const SettingAlarm();
  }

  AlarmSet setted(
      Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend) {
    return AlarmSet(
      alarm,
      offset,
      orchestratorState,
      lazyWeekend,
    );
  }

  AlarmError error() {
    return const AlarmError();
  }
}

/// @nodoc
const $AlarmState = _$AlarmStateTearOff();

/// @nodoc
mixin _$AlarmState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Alarm alarm, int initialOffset) off,
    required TResult Function() setting,
    required TResult Function(
            Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend)
        setted,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Alarm alarm, int initialOffset)? off,
    TResult Function()? setting,
    TResult Function(
            Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend)?
        setted,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(Off value) off,
    required TResult Function(SettingAlarm value) setting,
    required TResult Function(AlarmSet value) setted,
    required TResult Function(AlarmError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(Off value)? off,
    TResult Function(SettingAlarm value)? setting,
    TResult Function(AlarmSet value)? setted,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmStateCopyWith<$Res> {
  factory $AlarmStateCopyWith(
          AlarmState value, $Res Function(AlarmState) then) =
      _$AlarmStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AlarmStateCopyWithImpl<$Res> implements $AlarmStateCopyWith<$Res> {
  _$AlarmStateCopyWithImpl(this._value, this._then);

  final AlarmState _value;
  // ignore: unused_field
  final $Res Function(AlarmState) _then;
}

/// @nodoc
abstract class $AlarmInitialCopyWith<$Res> {
  factory $AlarmInitialCopyWith(
          AlarmInitial value, $Res Function(AlarmInitial) then) =
      _$AlarmInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$AlarmInitialCopyWithImpl<$Res> extends _$AlarmStateCopyWithImpl<$Res>
    implements $AlarmInitialCopyWith<$Res> {
  _$AlarmInitialCopyWithImpl(
      AlarmInitial _value, $Res Function(AlarmInitial) _then)
      : super(_value, (v) => _then(v as AlarmInitial));

  @override
  AlarmInitial get _value => super._value as AlarmInitial;
}

/// @nodoc

class _$AlarmInitial implements AlarmInitial {
  const _$AlarmInitial();

  @override
  String toString() {
    return 'AlarmState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AlarmInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Alarm alarm, int initialOffset) off,
    required TResult Function() setting,
    required TResult Function(
            Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend)
        setted,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Alarm alarm, int initialOffset)? off,
    TResult Function()? setting,
    TResult Function(
            Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend)?
        setted,
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
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(Off value) off,
    required TResult Function(SettingAlarm value) setting,
    required TResult Function(AlarmSet value) setted,
    required TResult Function(AlarmError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(Off value)? off,
    TResult Function(SettingAlarm value)? setting,
    TResult Function(AlarmSet value)? setted,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AlarmInitial implements AlarmState {
  const factory AlarmInitial() = _$AlarmInitial;
}

/// @nodoc
abstract class $OffCopyWith<$Res> {
  factory $OffCopyWith(Off value, $Res Function(Off) then) =
      _$OffCopyWithImpl<$Res>;
  $Res call({Alarm alarm, int initialOffset});

  $AlarmCopyWith<$Res> get alarm;
}

/// @nodoc
class _$OffCopyWithImpl<$Res> extends _$AlarmStateCopyWithImpl<$Res>
    implements $OffCopyWith<$Res> {
  _$OffCopyWithImpl(Off _value, $Res Function(Off) _then)
      : super(_value, (v) => _then(v as Off));

  @override
  Off get _value => super._value as Off;

  @override
  $Res call({
    Object? alarm = freezed,
    Object? initialOffset = freezed,
  }) {
    return _then(Off(
      alarm == freezed
          ? _value.alarm
          : alarm // ignore: cast_nullable_to_non_nullable
              as Alarm,
      initialOffset == freezed
          ? _value.initialOffset
          : initialOffset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $AlarmCopyWith<$Res> get alarm {
    return $AlarmCopyWith<$Res>(_value.alarm, (value) {
      return _then(_value.copyWith(alarm: value));
    });
  }
}

/// @nodoc

class _$Off implements Off {
  const _$Off(this.alarm, this.initialOffset);

  @override
  final Alarm alarm;
  @override
  final int initialOffset;

  @override
  String toString() {
    return 'AlarmState.off(alarm: $alarm, initialOffset: $initialOffset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Off &&
            (identical(other.alarm, alarm) ||
                const DeepCollectionEquality().equals(other.alarm, alarm)) &&
            (identical(other.initialOffset, initialOffset) ||
                const DeepCollectionEquality()
                    .equals(other.initialOffset, initialOffset)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(alarm) ^
      const DeepCollectionEquality().hash(initialOffset);

  @JsonKey(ignore: true)
  @override
  $OffCopyWith<Off> get copyWith => _$OffCopyWithImpl<Off>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Alarm alarm, int initialOffset) off,
    required TResult Function() setting,
    required TResult Function(
            Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend)
        setted,
    required TResult Function() error,
  }) {
    return off(alarm, initialOffset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Alarm alarm, int initialOffset)? off,
    TResult Function()? setting,
    TResult Function(
            Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend)?
        setted,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (off != null) {
      return off(alarm, initialOffset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(Off value) off,
    required TResult Function(SettingAlarm value) setting,
    required TResult Function(AlarmSet value) setted,
    required TResult Function(AlarmError value) error,
  }) {
    return off(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(Off value)? off,
    TResult Function(SettingAlarm value)? setting,
    TResult Function(AlarmSet value)? setted,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) {
    if (off != null) {
      return off(this);
    }
    return orElse();
  }
}

abstract class Off implements AlarmState {
  const factory Off(Alarm alarm, int initialOffset) = _$Off;

  Alarm get alarm => throw _privateConstructorUsedError;
  int get initialOffset => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OffCopyWith<Off> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingAlarmCopyWith<$Res> {
  factory $SettingAlarmCopyWith(
          SettingAlarm value, $Res Function(SettingAlarm) then) =
      _$SettingAlarmCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingAlarmCopyWithImpl<$Res> extends _$AlarmStateCopyWithImpl<$Res>
    implements $SettingAlarmCopyWith<$Res> {
  _$SettingAlarmCopyWithImpl(
      SettingAlarm _value, $Res Function(SettingAlarm) _then)
      : super(_value, (v) => _then(v as SettingAlarm));

  @override
  SettingAlarm get _value => super._value as SettingAlarm;
}

/// @nodoc

class _$SettingAlarm implements SettingAlarm {
  const _$SettingAlarm();

  @override
  String toString() {
    return 'AlarmState.setting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SettingAlarm);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Alarm alarm, int initialOffset) off,
    required TResult Function() setting,
    required TResult Function(
            Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend)
        setted,
    required TResult Function() error,
  }) {
    return setting();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Alarm alarm, int initialOffset)? off,
    TResult Function()? setting,
    TResult Function(
            Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend)?
        setted,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (setting != null) {
      return setting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(Off value) off,
    required TResult Function(SettingAlarm value) setting,
    required TResult Function(AlarmSet value) setted,
    required TResult Function(AlarmError value) error,
  }) {
    return setting(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(Off value)? off,
    TResult Function(SettingAlarm value)? setting,
    TResult Function(AlarmSet value)? setted,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) {
    if (setting != null) {
      return setting(this);
    }
    return orElse();
  }
}

abstract class SettingAlarm implements AlarmState {
  const factory SettingAlarm() = _$SettingAlarm;
}

/// @nodoc
abstract class $AlarmSetCopyWith<$Res> {
  factory $AlarmSetCopyWith(AlarmSet value, $Res Function(AlarmSet) then) =
      _$AlarmSetCopyWithImpl<$Res>;
  $Res call(
      {Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend});

  $AlarmCopyWith<$Res> get alarm;
}

/// @nodoc
class _$AlarmSetCopyWithImpl<$Res> extends _$AlarmStateCopyWithImpl<$Res>
    implements $AlarmSetCopyWith<$Res> {
  _$AlarmSetCopyWithImpl(AlarmSet _value, $Res Function(AlarmSet) _then)
      : super(_value, (v) => _then(v as AlarmSet));

  @override
  AlarmSet get _value => super._value as AlarmSet;

  @override
  $Res call({
    Object? alarm = freezed,
    Object? offset = freezed,
    Object? orchestratorState = freezed,
    Object? lazyWeekend = freezed,
  }) {
    return _then(AlarmSet(
      alarm == freezed
          ? _value.alarm
          : alarm // ignore: cast_nullable_to_non_nullable
              as Alarm,
      offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      orchestratorState == freezed
          ? _value.orchestratorState
          : orchestratorState // ignore: cast_nullable_to_non_nullable
              as bool,
      lazyWeekend == freezed
          ? _value.lazyWeekend
          : lazyWeekend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $AlarmCopyWith<$Res> get alarm {
    return $AlarmCopyWith<$Res>(_value.alarm, (value) {
      return _then(_value.copyWith(alarm: value));
    });
  }
}

/// @nodoc

class _$AlarmSet implements AlarmSet {
  const _$AlarmSet(
      this.alarm, this.offset, this.orchestratorState, this.lazyWeekend);

  @override
  final Alarm alarm;
  @override
  final int offset;
  @override
  final bool orchestratorState;
  @override
  final bool lazyWeekend;

  @override
  String toString() {
    return 'AlarmState.setted(alarm: $alarm, offset: $offset, orchestratorState: $orchestratorState, lazyWeekend: $lazyWeekend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AlarmSet &&
            (identical(other.alarm, alarm) ||
                const DeepCollectionEquality().equals(other.alarm, alarm)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
            (identical(other.orchestratorState, orchestratorState) ||
                const DeepCollectionEquality()
                    .equals(other.orchestratorState, orchestratorState)) &&
            (identical(other.lazyWeekend, lazyWeekend) ||
                const DeepCollectionEquality()
                    .equals(other.lazyWeekend, lazyWeekend)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(alarm) ^
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(orchestratorState) ^
      const DeepCollectionEquality().hash(lazyWeekend);

  @JsonKey(ignore: true)
  @override
  $AlarmSetCopyWith<AlarmSet> get copyWith =>
      _$AlarmSetCopyWithImpl<AlarmSet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Alarm alarm, int initialOffset) off,
    required TResult Function() setting,
    required TResult Function(
            Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend)
        setted,
    required TResult Function() error,
  }) {
    return setted(alarm, offset, orchestratorState, lazyWeekend);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Alarm alarm, int initialOffset)? off,
    TResult Function()? setting,
    TResult Function(
            Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend)?
        setted,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (setted != null) {
      return setted(alarm, offset, orchestratorState, lazyWeekend);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(Off value) off,
    required TResult Function(SettingAlarm value) setting,
    required TResult Function(AlarmSet value) setted,
    required TResult Function(AlarmError value) error,
  }) {
    return setted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(Off value)? off,
    TResult Function(SettingAlarm value)? setting,
    TResult Function(AlarmSet value)? setted,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) {
    if (setted != null) {
      return setted(this);
    }
    return orElse();
  }
}

abstract class AlarmSet implements AlarmState {
  const factory AlarmSet(
          Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend) =
      _$AlarmSet;

  Alarm get alarm => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  bool get orchestratorState => throw _privateConstructorUsedError;
  bool get lazyWeekend => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlarmSetCopyWith<AlarmSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmErrorCopyWith<$Res> {
  factory $AlarmErrorCopyWith(
          AlarmError value, $Res Function(AlarmError) then) =
      _$AlarmErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$AlarmErrorCopyWithImpl<$Res> extends _$AlarmStateCopyWithImpl<$Res>
    implements $AlarmErrorCopyWith<$Res> {
  _$AlarmErrorCopyWithImpl(AlarmError _value, $Res Function(AlarmError) _then)
      : super(_value, (v) => _then(v as AlarmError));

  @override
  AlarmError get _value => super._value as AlarmError;
}

/// @nodoc

class _$AlarmError implements AlarmError {
  const _$AlarmError();

  @override
  String toString() {
    return 'AlarmState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AlarmError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Alarm alarm, int initialOffset) off,
    required TResult Function() setting,
    required TResult Function(
            Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend)
        setted,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Alarm alarm, int initialOffset)? off,
    TResult Function()? setting,
    TResult Function(
            Alarm alarm, int offset, bool orchestratorState, bool lazyWeekend)?
        setted,
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
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(Off value) off,
    required TResult Function(SettingAlarm value) setting,
    required TResult Function(AlarmSet value) setted,
    required TResult Function(AlarmError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(Off value)? off,
    TResult Function(SettingAlarm value)? setting,
    TResult Function(AlarmSet value)? setted,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AlarmError implements AlarmState {
  const factory AlarmError() = _$AlarmError;
}
