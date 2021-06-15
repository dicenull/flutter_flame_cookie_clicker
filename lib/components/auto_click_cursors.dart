import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cookie_controller.dart';
import 'package:flutter_flame_cookie_clicker/controllers/cursor_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AutoClickCursors extends PositionComponent with HasGameRef {
  final double cursorPadding = .195;
  final speed = .1;
  double theta = .0;
  int index = 0;
  Timer? timer;

  @override
  void update(double dt) {
    timer?.update(dt);

    theta += speed * dt;
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
        3.0 / count,
        callback: () {
          context.read(cookieProvider.notifier).bake();

          final duration = .3;
          final _parent = (parent as PositionComponent);
          final r = _parent.size.x / 2;
          final l = r + r * cursorPadding;
          final offset = index * cursorPadding;
          final p = theta + offset + speed * duration;

          final cursor = (children[index] as PositionComponent);
          cursor.addEffect(
            MoveEffect(
              path: [
                _transform(Vector2.all(r), l - cursor.size.x / 2, p),
                _transform(Vector2.all(r), l, p),
              ],
              duration: duration,
              curve: Curves.easeInOut,
            ),
          );

          index = (index + 1) % children.length;
        },
        repeat: true,
      )..start();
    }
  }

  void _moveCursors() {
    final _parent = (parent as PositionComponent);

    final r = _parent.size.x / 2;
    final padding = r * cursorPadding;
    final l = r + padding;
    final _size = r * .3;

    children.asMap().forEach((i, child) {
      final autoCursor = child as SpriteComponent;
      final p = theta + i * cursorPadding;

      autoCursor
        ..position = _transform(Vector2.all(r), l, p)
        ..size = Vector2.all(_size)
        ..angle = -p;
    });
  }

  Vector2 _transform(Vector2 offset, double l, double x) =>
      offset + Vector2(l * cos(x), -l * sin(x));
}
