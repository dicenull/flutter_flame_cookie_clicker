import 'package:flutter_flame_cookie_clicker/controllers/cookie_controller.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cursor_state.dart';
import 'package:flutter_flame_cookie_clicker/controllers/store_controller.dart';
import 'package:flutter_flame_cookie_clicker/repositories/setting_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cursorProvider = StateNotifierProvider<CursorController, CursorState>(
    (ref) => CursorController(ref.read));

final canBuyCursorProvider = StateProvider(
  (ref) =>
      ref.watch(cookieProvider).bakeCount >= ref.watch(cursorProvider).nextCost,
);

class CursorController extends StateNotifier<CursorState> {
  final Reader reader;
  CursorController(this.reader) : super(CursorState()) {
    _fetch();

    reader(storeProvider.notifier)
        .stream
        .map((state) => state.bulkLevel)
        .distinct()
        .listen(
          (count) => _setNextCost(count, state.cost.toDouble()),
        );

    stream.map((state) => state.cost).distinct().listen(
          (cost) =>
              _setNextCost(reader(storeProvider).bulkLevel, cost.toDouble()),
        );
  }

  void _setNextCost(int count, double cost) {
    double nextCost = cost;
    for (int i = 0; i < count; i++) {
      nextCost *= CursorState.amount;
    }

    state = state.copyWith(nextCost: nextCost.round());
  }

  Future _fetch() async {
    final initCount = await reader(settingRepository).getInt(Settings.cursor);

    for (int i = 0; i < initCount; i++) {
      _addCursor();
    }
  }

  bool buyCursor() {
    if (reader(cookieProvider).bakeCount < state.nextCost) {
      return false;
    }

    reader(cookieProvider.notifier).pay(state.nextCost);
    _addCursor();
    return true;
  }

  void _addCursor() {
    state = state.copyWith(
      count: state.count + reader(storeProvider).bulkLevel,
      cost: state.nextCost,
    );

    reader(settingRepository).setInt(Settings.cursor, state.count);
  }
}
