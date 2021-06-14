import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_cookie_clicker/components/main_cookie.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final cookieClicker = Provider((_) => CookieClicker());

class CookieClicker extends BaseGame with HasTapableComponents {
  @override
  Future<void> onLoad() async {
    await Flame.images.loadAll([
      'ww.png',
      'cursor.png',
    ]);

    add(MainCookie());
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), PaletteEntry(Colors.grey).paint());

    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
