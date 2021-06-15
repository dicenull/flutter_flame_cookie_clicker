import 'package:freezed_annotation/freezed_annotation.dart';
part 'cursor_state.freezed.dart';

@freezed
class CursorState with _$CursorState {
  CursorState._();
  factory CursorState({
    @Default(0) int count,
    @Default(13) double cost,
  }) = _CursorState;

  late final double nextCost = cost * 1.15;
}
