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

  Future<int> getInt(Settings settings) async =>
      (await _prefs).getInt(describeEnum(settings)) ?? 0;
  Future<void> setInt(Settings settings, int point) async =>
      (await _prefs).setInt(describeEnum(settings), point);
}
