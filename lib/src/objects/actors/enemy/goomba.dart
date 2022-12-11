import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/animation_game_object.dart';
import 'package:game_all_in_one/src/objects/stateful_game_object.dart';

/// 酷栗宝
class Goomba extends AnimationGameObject {
  Goomba({
    super.position,
    super.gridPosition,
  }) : super(
          spriteAnimation: GameObjectSpriteAnimation(
            size: Vector2.all(16),
            frames: [
              Vector2(187, 894),
              Vector2(208, 894),
            ],
            stepTime: 0.16,
          ),
          size: Vector2.all(16),
        );

  final velocity = Vector2.zero();
}
