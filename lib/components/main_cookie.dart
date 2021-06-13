import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flame/particles.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cookie_controller.dart';
import 'package:flutter_flame_cookie_clicker/cookie_clicker.dart';
import 'package:flutter_flame_cookie_clicker/particles/drop_cookie_particle.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainCookie = Provider((_) => MainCookie());

class MainCookie extends SpriteComponent
    with HasGameRef<CookieClicker>, Tapable {
  @override
  bool onTapDown(TapDownInfo event) {
    gameRef.buildContext?.read(cookieProvider.notifier).bake();

    gameRef.add(
        DropCookieParticle(pos: event.eventPosition.widget, size: size / 10));

    return true;
  }

  @override
  Future<void>? onLoad() {
    sprite = Sprite(Flame.images.fromCache('ww.png'));
    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 gameSize) {
    size = Vector2.all(min(gameSize.x, gameSize.y) * .6);
    topLeftPosition = Vector2(gameSize.x / 2 - size.x / 2, 64);

    super.onGameResize(gameSize);
  }
}
