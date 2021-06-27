import 'package:flame/components.dart';
import 'package:flame/particles.dart';

class CountCookieParticle extends ParticleComponent {
  final Vector2 pos;
  final TextPaint textPaint;
  final String text;

  CountCookieParticle(this.text, {required this.textPaint, required this.pos})
      : super(
          particle: MovingParticle(
            lifespan: 2,
            child: ComputedParticle(
              renderer: (c, p) => textPaint.render(
                c,
                text,
                pos,
              ),
            ),
            to: Vector2(0, -100),
          ),
        );
}
