import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/particles.dart';

class DropCookieParticle extends ParticleComponent {
  static Random rnd = Random();
  final Vector2 pos;
  final Vector2 size;

  DropCookieParticle({required this.pos, required this.size})
      : super(
          particle: AcceleratedParticle(
            acceleration: Vector2(0, 200),
            speed: Vector2((rnd.nextDouble() - .5) * 100, -50),
            lifespan: 1,
            position: pos,
            child: ImageParticle(
              image: Flame.images.fromCache('ww.png'),
              size: size,
            ),
          ),
        );
}
