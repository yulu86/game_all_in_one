import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/animation_game_object.dart';
import 'package:game_all_in_one/src/objects/stateful_game_object.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';

class FlippingCoin extends AnimationGameObject {
  FlippingCoin({
    super.position,
    super.gridPosition,
  }) : super(
          spriteAnimation: GameObjectSpriteAnimation(
            size: Vector2(8, 14),
            frames: [
              Vector2(431, 145),
              Vector2(438, 145),
              Vector2(448, 145),
              Vector2(459, 145),
            ],
            stepTime: 0.12,
          ),
          size: Vector2(14, 14),
        );

  final double initialJumpVelocity = -15.0;
  final velocity = Vector2.zero();

  double _jumpVelocity = 0.0;
  double _initPositionY = 0.0;

  @override
  Future<void>? onLoad() {
    _initPositionY = position.y;
    _jumpVelocity = initialJumpVelocity;
    addHitbox();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _move();
    _removeFallToFloor();

    super.update(dt);
  }

  void _move() {
    y += _jumpVelocity;
    _jumpVelocity += gravity;
  }

  void _removeFallToFloor() {
    if (y > _initPositionY) {
      removeFromParent();
    }
  }
}
