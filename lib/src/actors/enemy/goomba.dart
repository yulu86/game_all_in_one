import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/utils/sprite_utils.dart';

/// 酷栗宝
class Goomba extends
class Goomba extends SpriteAnimationComponent with HasGameRef<MarioGame> {
  Goomba()
      : super(
          size: Vector2.all(32),
          anchor: Anchor.bottomLeft,
        );

  @override
  Future<void>? onLoad() async {
    animation = getAnimation(
      image: game.gameSpriteImage,
      size: Vector2.all(16),
      frames: [
        Vector2(187, 894),
        Vector2(208, 894),
      ],
      stepTime: 0.16,
    );
    position = Vector2(150, game.size.y - 64);
    add(
      MoveEffect.by(
        Vector2(-2 * size.x, 0),
        EffectController(
          duration: 3,
          alternate: true,
          infinite: true,
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
