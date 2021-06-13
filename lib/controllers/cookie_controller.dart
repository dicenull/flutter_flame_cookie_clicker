import 'package:flutter_flame_cookie_clicker/controllers/cookie_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cookieProvider = StateNotifierProvider<CookieController, CookieState>(
    (_) => CookieController());

class CookieController extends StateNotifier<CookieState> {
  CookieController() : super(CookieState());

  void bake() {
    state = state.copyWith(bakeCount: state.bakeCount + 1);
  }
}
