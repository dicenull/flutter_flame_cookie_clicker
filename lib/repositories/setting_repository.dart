import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingRepository = Provider(
  (_) => SettingRepository(),
);

enum Settings {
  cookie,
}

class SettingRepository {
  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  Future<int> getCookieCount() async =>
      (await _prefs).getInt(describeEnum(Settings.cookie)) ?? 0;
  Future<void> setCookieCount(int count) async =>
      (await _prefs).setInt(describeEnum(Settings.cookie), count);
}
