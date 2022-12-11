import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/animation_game_object.dart';
import 'package:game_all_in_one/src/objects/stateful_game_object.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';

class FlippingCoin extends AnimationGameObject {
  FlippingCoin()
      : super(
          spriteAnimation: GameObjectSpriteAnimation(
            size: Vector2.all(14),
            frames: [
              Vector2(427, 145),
              Vector2(435, 145),
              Vector2(445, 145),
              Vector2(456, 145),
            ],
            stepTime: 0.16,
          ),
          size: Vector2.all(16) * gameScale,
        );
}
