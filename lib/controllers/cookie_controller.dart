import 'package:flutter_flame_cookie_clicker/controllers/cookie_state.dart';
import 'package:flutter_flame_cookie_clicker/repositories/setting_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cookieProvider = StateNotifierProvider<CookieController, CookieState>(
    (ref) => CookieController(ref.read));

class CookieController extends StateNotifier<CookieState> {
  final Reader reader;

  CookieController(this.reader) : super(CookieState()) {
    _fetch();

    stream.map((state) => state.bakeCount).distinct().listen((count) {
      reader(settingRepository).setInt(Settings.cookie, count);
    });
  }

  Future _fetch() async {
    final initCount = await reader(settingRepository).getInt(Settings.cookie);
    state = state.copyWith(bakeCount: initCount);
  }

  void bake() {
    state = state.copyWith(bakeCount: state.bakeCount + 1);
  }

  void pay(int point) {
    state = state.copyWith(bakeCount: state.bakeCount - point);
  }
}
