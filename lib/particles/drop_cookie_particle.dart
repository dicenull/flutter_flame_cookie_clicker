import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/particles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropCookieParticle extends ParticleComponent {
  static Random rnd = Random();
  final Vector2 pos;
  final Vector2 size;

  DropCookieParticle({required this.pos, required this.size})
      : super(
          particle: AcceleratedParticle(
            acceleration: Offset(0, 200),
            speed: Offset((rnd.nextDouble() - .5) * 100, -50),
            lifespan: 1,
            position: pos.toOffset(),
            child: ImageParticle(
              image: Flame.images.fromCache('ww.png'),
              size: size,
            ),
          ),
        );
}
