import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_cookie_clicker/components/auto_click_cursors.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cookie_controller.dart';
import 'package:flutter_flame_cookie_clicker/cookie_clicker.dart';
import 'package:flutter_flame_cookie_clicker/particles/count_cookie_particle.dart';
import 'package:flutter_flame_cookie_clicker/particles/drop_cookie_particle.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainCookie = Provider((_) => MainCookie());

class MainCookie extends SpriteComponent
    with HasGameRef<CookieClicker>, Tapable {
  final textPaint = TextPaint(config: TextPaintConfig(color: Colors.white));

  @override
  bool onTapDown(TapDownInfo event) {
    final context = gameRef.buildContext;
    if (context == null) return false;

    context.read(cookieProvider.notifier).bake();

    final pos = event.eventPosition.widget;

    gameRef.add(DropCookieParticle(pos: pos, size: size / 10));
    gameRef.add(CountCookieParticle('+1', pos: pos, textPaint: textPaint));

    return true;
  }

  @override
  Future<void>? onLoad() {
    sprite = Sprite(Flame.images.fromCache('ww.png'));
    addChild(AutoClickCursors());

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 gameSize) {
    size = Vector2.all(min(gameSize.x, gameSize.y) * .6);
    position = Vector2(gameSize.x / 2 - size.x / 2, 64);

    super.onGameResize(gameSize);
  }
}
