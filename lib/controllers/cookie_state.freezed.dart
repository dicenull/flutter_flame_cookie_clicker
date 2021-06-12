// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'cookie_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CookieStateTearOff {
  const _$CookieStateTearOff();

  _CookieState call({int bakeCount = 0}) {
    return _CookieState(
      bakeCount: bakeCount,
    );
  }
}

/// @nodoc
const $CookieState = _$CookieStateTearOff();

/// @nodoc
mixin _$CookieState {
  int get bakeCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CookieStateCopyWith<CookieState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CookieStateCopyWith<$Res> {
  factory $CookieStateCopyWith(
          CookieState value, $Res Function(CookieState) then) =
      _$CookieStateCopyWithImpl<$Res>;
  $Res call({int bakeCount});
}

/// @nodoc
class _$CookieStateCopyWithImpl<$Res> implements $CookieStateCopyWith<$Res> {
  _$CookieStateCopyWithImpl(this._value, this._then);

  final CookieState _value;
  // ignore: unused_field
  final $Res Function(CookieState) _then;

  @override
  $Res call({
    Object? bakeCount = freezed,
  }) {
    return _then(_value.copyWith(
      bakeCount: bakeCount == freezed
          ? _value.bakeCount
          : bakeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CookieStateCopyWith<$Res>
    implements $CookieStateCopyWith<$Res> {
  factory _$CookieStateCopyWith(
          _CookieState value, $Res Function(_CookieState) then) =
      __$CookieStateCopyWithImpl<$Res>;
  @override
  $Res call({int bakeCount});
}

/// @nodoc
class __$CookieStateCopyWithImpl<$Res> extends _$CookieStateCopyWithImpl<$Res>
    implements _$CookieStateCopyWith<$Res> {
  __$CookieStateCopyWithImpl(
      _CookieState _value, $Res Function(_CookieState) _then)
      : super(_value, (v) => _then(v as _CookieState));

  @override
  _CookieState get _value => super._value as _CookieState;

  @override
  $Res call({
    Object? bakeCount = freezed,
  }) {
    return _then(_CookieState(
      bakeCount: bakeCount == freezed
          ? _value.bakeCount
          : bakeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CookieState implements _CookieState {
  _$_CookieState({this.bakeCount = 0});

  @JsonKey(defaultValue: 0)
  @override
  final int bakeCount;

  @override
  String toString() {
    return 'CookieState(bakeCount: $bakeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CookieState &&
            (identical(other.bakeCount, bakeCount) ||
                const DeepCollectionEquality()
                    .equals(other.bakeCount, bakeCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bakeCount);

  @JsonKey(ignore: true)
  @override
  _$CookieStateCopyWith<_CookieState> get copyWith =>
      __$CookieStateCopyWithImpl<_CookieState>(this, _$identity);
}

abstract class _CookieState implements CookieState {
  factory _CookieState({int bakeCount}) = _$_CookieState;

  @override
  int get bakeCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CookieStateCopyWith<_CookieState> get copyWith =>
      throw _privateConstructorUsedError;
}
