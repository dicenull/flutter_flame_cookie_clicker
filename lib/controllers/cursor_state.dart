import 'package:freezed_annotation/freezed_annotation.dart';
part 'cursor_state.freezed.dart';

@freezed
class CursorState with _$CursorState {
  CursorState._();
  factory CursorState({
    @Default(0) int count,
    @Default(13) int cost,
    @Default(15) int nextCost,
  }) = _CursorState;

  static double amount = 1.15;
}
