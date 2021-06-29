import 'package:flutter_flame_cookie_clicker/controllers/store_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final storeProvider = StateNotifierProvider<StoreController, StoreState>(
    (_) => StoreController());

class StoreController extends StateNotifier<StoreState> {
  StoreController() : super(StoreState());

  void toBuy() => state = state.copyWith(isBuy: true);
  void toSell() => state = state.copyWith(isBuy: false);

  void single() => state = state.copyWith(bulkLevel: 1);
  void bulk10() => state = state.copyWith(bulkLevel: 10);
  void bulk100() => state = state.copyWith(bulkLevel: 100);
}
