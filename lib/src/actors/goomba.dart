import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:game_all_in_one/src/game_controller.dart';
import 'package:game_all_in_one/src/mario_game.dart';

/// 酷栗宝
class Goomba extends SpriteAnimationComponent with HasGameRef<MarioGame> {
  Goomba() : super(size: Vector2.all(32));

  @override
  Future<void>? onLoad() async {
    final marioImage = game.images.fromCache(marioGameImage);
    animation = getAnimation(
      image: marioImage,
      size: Vector2.all(16),
      frames: [
        Vector2(187, 894),
        Vector2(208, 894),
      ],
      stepTime: 0.16,
    );
    position = Vector2(150, 150);
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

  SpriteAnimation getAnimation({
    required Image image,
    required Vector2 size,
    required List<Vector2> frames,
    double stepTime = double.infinity,
  }) {
    final sprites = frames
        .map((srcPosition) => Sprite(
              image,
              srcSize: size,
              srcPosition: srcPosition,
            ))
        .toList();
    return SpriteAnimation.spriteList(
      sprites,
      stepTime: stepTime,
    );
  }
}
