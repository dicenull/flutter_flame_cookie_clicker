import 'dart:math';

import 'package:flutter_flame_cookie_clicker/controllers/cookie_controller.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cursor_state.dart';
import 'package:flutter_flame_cookie_clicker/controllers/store_controller.dart';
import 'package:flutter_flame_cookie_clicker/repositories/setting_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cursorProvider = StateNotifierProvider<CursorController, CursorState>(
    (ref) => CursorController(ref.read));

final isValidCursorProvider = StateProvider(
  (ref) =>
      (ref.watch(storeProvider).isBuy &&
          ref.watch(cookieProvider).bakeCount >=
              ref.watch(cursorProvider).nextCost) ||
      (ref.watch(storeProvider).isSell && ref.watch(cursorProvider).count > 0),
);

class CursorController extends StateNotifier<CursorState> {
  final Reader reader;
  CursorController(this.reader) : super(CursorState()) {
    _fetch();

    reader(storeProvider.notifier)
        .stream
        .map((state) => state.bulkLevel)
        .distinct()
        .listen((_) => _setNextCost());
    reader(storeProvider.notifier)
        .stream
        .map((state) => state.isBuy)
        .distinct()
        .listen((_) => _setNextCost());

    stream.map((state) => state.cost).distinct().listen(
      (_) {
        _setNextCost();

        reader(settingRepository).setInt(Settings.cursor, state.count);
      },
    );
  }

  void _setNextCost() {
    final count = reader(storeProvider).bulkLevel;

    if (reader(storeProvider).isBuy) {
      double nextCost = state.cost.toDouble();
      for (int i = 0; i < count; i++) {
        nextCost *= CursorState.amount;
      }

      state = state.copyWith(nextCost: nextCost.round());
    } else {
      double nextCost = 0;
      double prevCost = state.cost.toDouble();
      final N = min(count, state.count);

      for (int i = 0; i < N; i++) {
        nextCost += prevCost * .15;
        prevCost = (state.cost / 1.15);
      }

      state = state.copyWith(nextCost: nextCost.round());
    }
  }

  Future _fetch() async {
    final initCount = await reader(settingRepository).getInt(Settings.cursor);

    for (int i = 0; i < initCount; i++) {
      _addCursor();
    }
  }

  bool actionCursor() {
    if (reader(storeProvider).isBuy) {
      return buyCursor();
    }

    sellCursor();
    return true;
  }

  bool buyCursor() {
    if (reader(cookieProvider).bakeCount < state.nextCost) {
      return false;
    }

    reader(cookieProvider.notifier).pay(state.nextCost);
    _addCursor();
    return true;
  }

  void sellCursor() {
    reader(cookieProvider.notifier).add(state.nextCost);
    _removeCursor();
  }

  void _removeCursor() {
    final removeCount = min(reader(storeProvider).bulkLevel, state.count);

    double prevCost = state.cost.toDouble();
    for (int i = 0; i < removeCount; i++) {
      prevCost = (state.cost / 1.15);
    }

    state = state.copyWith(
      count: state.count - removeCount,
      cost: prevCost.round(),
    );
  }

  void _addCursor() {
    state = state.copyWith(
      count: state.count + reader(storeProvider).bulkLevel,
      cost: state.nextCost,
    );
  }
}
