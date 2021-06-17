// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'cursor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CursorStateTearOff {
  const _$CursorStateTearOff();

  _CursorState call({int count = 0, double cost = 13}) {
    return _CursorState(
      count: count,
      cost: cost,
    );
  }
}

/// @nodoc
const $CursorState = _$CursorStateTearOff();

/// @nodoc
mixin _$CursorState {
  int get count => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CursorStateCopyWith<CursorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursorStateCopyWith<$Res> {
  factory $CursorStateCopyWith(
          CursorState value, $Res Function(CursorState) then) =
      _$CursorStateCopyWithImpl<$Res>;
  $Res call({int count, double cost});
}

/// @nodoc
class _$CursorStateCopyWithImpl<$Res> implements $CursorStateCopyWith<$Res> {
  _$CursorStateCopyWithImpl(this._value, this._then);

  final CursorState _value;
  // ignore: unused_field
  final $Res Function(CursorState) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? cost = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$CursorStateCopyWith<$Res>
    implements $CursorStateCopyWith<$Res> {
  factory _$CursorStateCopyWith(
          _CursorState value, $Res Function(_CursorState) then) =
      __$CursorStateCopyWithImpl<$Res>;
  @override
  $Res call({int count, double cost});
}

/// @nodoc
class __$CursorStateCopyWithImpl<$Res> extends _$CursorStateCopyWithImpl<$Res>
    implements _$CursorStateCopyWith<$Res> {
  __$CursorStateCopyWithImpl(
      _CursorState _value, $Res Function(_CursorState) _then)
      : super(_value, (v) => _then(v as _CursorState));

  @override
  _CursorState get _value => super._value as _CursorState;

  @override
  $Res call({
    Object? count = freezed,
    Object? cost = freezed,
  }) {
    return _then(_CursorState(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_CursorState extends _CursorState {
  _$_CursorState({this.count = 0, this.cost = 13}) : super._();

  @JsonKey(defaultValue: 0)
  @override
  final int count;
  @JsonKey(defaultValue: 13)
  @override
  final double cost;

  @override
  String toString() {
    return 'CursorState(count: $count, cost: $cost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CursorState &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.cost, cost) ||
                const DeepCollectionEquality().equals(other.cost, cost)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(cost);

  @JsonKey(ignore: true)
  @override
  _$CursorStateCopyWith<_CursorState> get copyWith =>
      __$CursorStateCopyWithImpl<_CursorState>(this, _$identity);
}

abstract class _CursorState extends CursorState {
  factory _CursorState({int count, double cost}) = _$_CursorState;
  _CursorState._() : super._();

  @override
  int get count => throw _privateConstructorUsedError;
  @override
  double get cost => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CursorStateCopyWith<_CursorState> get copyWith =>
      throw _privateConstructorUsedError;
}
