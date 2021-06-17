import 'package:freezed_annotation/freezed_annotation.dart';
part 'store_state.freezed.dart';

@freezed
class StoreState with _$StoreState {
  StoreState._();
  factory StoreState({
    @Default(true) bool isBuy,
    @Default(1) int bulkLevel,
  }) = _StoreState;

  late final bool isSell = !isBuy;

  late final bool isSingleBulk = (bulkLevel == 1);
  late final bool isBulk10 = (bulkLevel == 10);
  late final bool isBulk100 = (bulkLevel == 100);
}
