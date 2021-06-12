import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cookie_controller.dart';
import 'package:flutter_flame_cookie_clicker/cookie_clicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainCookie = Provider((_) => MainCookie());

class MainCookie extends SpriteComponent with HasGameRef<CookieClicker> {
  void click() {
    gameRef.buildContext?.read(cookieController.notifier).bake();
  }

  @override
  Future<void>? onLoad() {
    sprite = Sprite(gameRef.images.fromCache('ww.png'));
    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 gameSize) {
    size = Vector2.all(min(gameSize.x, gameSize.y) * .6);
    topLeftPosition = Vector2(gameSize.x / 2 - size.x / 2, 64);

    super.onGameResize(gameSize);
  }
}
