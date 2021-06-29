// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'store_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StoreStateTearOff {
  const _$StoreStateTearOff();

  _StoreState call({bool isBuy = true, int bulkLevel = 1}) {
    return _StoreState(
      isBuy: isBuy,
      bulkLevel: bulkLevel,
    );
  }
}

/// @nodoc
const $StoreState = _$StoreStateTearOff();

/// @nodoc
mixin _$StoreState {
  bool get isBuy => throw _privateConstructorUsedError;
  int get bulkLevel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreStateCopyWith<StoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreStateCopyWith<$Res> {
  factory $StoreStateCopyWith(
          StoreState value, $Res Function(StoreState) then) =
      _$StoreStateCopyWithImpl<$Res>;
  $Res call({bool isBuy, int bulkLevel});
}

/// @nodoc
class _$StoreStateCopyWithImpl<$Res> implements $StoreStateCopyWith<$Res> {
  _$StoreStateCopyWithImpl(this._value, this._then);

  final StoreState _value;
  // ignore: unused_field
  final $Res Function(StoreState) _then;

  @override
  $Res call({
    Object? isBuy = freezed,
    Object? bulkLevel = freezed,
  }) {
    return _then(_value.copyWith(
      isBuy: isBuy == freezed
          ? _value.isBuy
          : isBuy // ignore: cast_nullable_to_non_nullable
              as bool,
      bulkLevel: bulkLevel == freezed
          ? _value.bulkLevel
          : bulkLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$StoreStateCopyWith<$Res> implements $StoreStateCopyWith<$Res> {
  factory _$StoreStateCopyWith(
          _StoreState value, $Res Function(_StoreState) then) =
      __$StoreStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isBuy, int bulkLevel});
}

/// @nodoc
class __$StoreStateCopyWithImpl<$Res> extends _$StoreStateCopyWithImpl<$Res>
    implements _$StoreStateCopyWith<$Res> {
  __$StoreStateCopyWithImpl(
      _StoreState _value, $Res Function(_StoreState) _then)
      : super(_value, (v) => _then(v as _StoreState));

  @override
  _StoreState get _value => super._value as _StoreState;

  @override
  $Res call({
    Object? isBuy = freezed,
    Object? bulkLevel = freezed,
  }) {
    return _then(_StoreState(
      isBuy: isBuy == freezed
          ? _value.isBuy
          : isBuy // ignore: cast_nullable_to_non_nullable
              as bool,
      bulkLevel: bulkLevel == freezed
          ? _value.bulkLevel
          : bulkLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_StoreState extends _StoreState {
  _$_StoreState({this.isBuy = true, this.bulkLevel = 1}) : super._();

  @JsonKey(defaultValue: true)
  @override
  final bool isBuy;
  @JsonKey(defaultValue: 1)
  @override
  final int bulkLevel;

  @override
  String toString() {
    return 'StoreState(isBuy: $isBuy, bulkLevel: $bulkLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreState &&
            (identical(other.isBuy, isBuy) ||
                const DeepCollectionEquality().equals(other.isBuy, isBuy)) &&
            (identical(other.bulkLevel, bulkLevel) ||
                const DeepCollectionEquality()
                    .equals(other.bulkLevel, bulkLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isBuy) ^
      const DeepCollectionEquality().hash(bulkLevel);

  @JsonKey(ignore: true)
  @override
  _$StoreStateCopyWith<_StoreState> get copyWith =>
      __$StoreStateCopyWithImpl<_StoreState>(this, _$identity);
}

abstract class _StoreState extends StoreState {
  factory _StoreState({bool isBuy, int bulkLevel}) = _$_StoreState;
  _StoreState._() : super._();

  @override
  bool get isBuy => throw _privateConstructorUsedError;
  @override
  int get bulkLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoreStateCopyWith<_StoreState> get copyWith =>
      throw _privateConstructorUsedError;
}
