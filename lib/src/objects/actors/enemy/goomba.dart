import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/animation_game_object.dart';
import 'package:game_all_in_one/src/objects/stateful_game_object.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';

/// 酷栗宝
class Goomba extends AnimationGameObject with CollisionCallbacks {
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

  int _currentDirection = rightDirection;

  @override
  Future<void>? onLoad() async {
    addHitbox();
    _setupSpeed();
    super.onLoad();
  }

  @override
  void update(double dt) {
    _move();
    _removeWhenOutOfEdge();

    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is ScreenHitbox) {
      return;
    }

    _currentDirection *= -1;
    _setupSpeed();
  }

  void _setupSpeed() {
    velocity.x = _currentDirection * itemHorizontalSpeed;
  }

  void _move() {
    position += velocity;
  }

  void _removeWhenOutOfEdge() {
    if ((absolutePosition.x + size.x) <= 0) {
      removeFromParent();
    }
  }
}
