import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_cookie_clicker/components/main_cookie.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cookie_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final cookieClicker = Provider((_) => CookieClicker());

class CookieClicker extends BaseGame with TapDetector {
  @override
  Future<void> onLoad() async {
    await images.load('ww.png');

    add(MainCookie());
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), PaletteEntry(Colors.grey).paint());

    super.render(canvas);
  }

  @override
  void update(double dt) {
    // TODO: implement update

    super.update(dt);
  }

  @override
  void onTap() {
    buildContext!.read(cookieController.notifier).bake();

    super.onTap();
  }
}
