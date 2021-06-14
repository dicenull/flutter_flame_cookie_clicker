import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cookie_controller.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cursor_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AutoClickCursors extends PositionComponent with HasGameRef {
  double theta = .0;

  @override
  void update(double dt) {
    theta += .1 * dt;
    _check();
    _moveCursors();
    super.update(dt);
  }

  void _check() {
    final context = gameRef.buildContext;
    if (context == null) return;

    final count = context.read(cursorProvider).count;
    if (children.length != count) {
      int sub = count - children.length;
      final image = Flame.images.fromCache('cursor.png');
      final size = (parent as PositionComponent).size.x * .1;
      for (int i = 0; i < sub; i++) {
        addChild(
          SpriteComponent(sprite: Sprite(image))
            ..size = Vector2.all(size)
            ..anchor = Anchor.center
            ..addChild(
              TimerComponent(
                Timer(
                  3,
                  callback: () => context.read(cookieProvider.notifier).bake(),
                  repeat: true,
                )..start(),
              ),
            ),
        );
      }
    }
  }

  void _moveCursors() {
    final _parent = (parent as PositionComponent);

    final r = _parent.size.x / 2;
    final padding = r * .2;
    final l = r + padding;

    children.asMap().forEach((i, child) {
      final autoCursor = child as SpriteComponent;
      final p = theta + i * .1;

      final _image = autoCursor.sprite?.image;
      if (_image == null) return;

      autoCursor
        ..position = Vector2.all(r) + Vector2(l * cos(p), -l * sin(p))
        ..angle = -p;
    });
  }
}
