import 'package:freezed_annotation/freezed_annotation.dart';
part 'cookie_state.freezed.dart';

@freezed
class CookieState with _$CookieState {
  factory CookieState({
    @Default(0) int bakeCount,
  }) = _CookieState;
}
