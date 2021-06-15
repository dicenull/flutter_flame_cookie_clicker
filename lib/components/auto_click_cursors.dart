import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cookie_controller.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cursor_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AutoClickCursors extends PositionComponent with HasGameRef {
  final double cursorPadding = .2;
  double theta = .0;
  int index = 0;
  Timer? timer;

  @override
  void update(double dt) {
    timer?.update(dt);

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
      for (int i = 0; i < sub; i++) {
        addChild(
          SpriteComponent(
            sprite: Sprite(image),
          )..anchor = Anchor.center,
        );
      }

      timer = Timer(
        10.0 / count,
        callback: () {
          context.read(cookieProvider.notifier).bake();

          final _parent = (parent as PositionComponent);
          final r = _parent.size.x / 2;
          final offset = index * cursorPadding;
          final p = theta + offset;
          final p1 = p + cursorPadding;
          final p2 = p + cursorPadding * 2;
          final transform =
              (double v) => Vector2.all(r) + Vector2(r * cos(v), -r * sin(v));

          final cursor = (children[index] as PositionComponent);
          cursor.addEffect(MoveEffect(
            path: [
              cursor.position,
              transform(p1),
              transform(p2),
            ],
            duration: 1,
          ));

          index++;
        },
        repeat: true,
      )..start();
    }
  }

  void _moveCursors() {
    final _parent = (parent as PositionComponent);

    final r = _parent.size.x / 2;
    final padding = r * .2;
    final l = r + padding;
    final _size = r * .3;

    children.asMap().forEach((i, child) {
      final autoCursor = child as SpriteComponent;
      final p = theta + i * cursorPadding;

      autoCursor
        ..position = Vector2.all(r) + Vector2(l * cos(p), -l * sin(p))
        ..size = Vector2.all(_size)
        ..angle = -p;
    });
  }
}
