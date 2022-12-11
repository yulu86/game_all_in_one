import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/animation_game_object.dart';
import 'package:game_all_in_one/src/objects/obstacle/brick.dart';
import 'package:game_all_in_one/src/objects/obstacle/ground_brick.dart';
import 'package:game_all_in_one/src/objects/obstacle/pipe.dart';
import 'package:game_all_in_one/src/objects/obstacle/qustion_brick.dart';
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
  final Vector2 fromAbove = Vector2(0, -1);

  int _currentDirection = rightDirection;

  @override
  Future<void>? onLoad() async {
    addHitbox(collisionType: CollisionType.active);
    _setupSpeed();
    super.onLoad();
  }

  @override
  void update(double dt) {
    _move(dt);
    _removeWhenOutOfEdge();

    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is ScreenHitbox) {
      return;
    }

    if (velocity.y > 0) {
      velocity.y = 0;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Pipe) {
      if (velocity.y > 0) {
        _currentDirection *= -1;
        _setupSpeed();
      }
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (!isColliding) {
      velocity.y = gravity;
    }
  }

  void _setupSpeed() {
    velocity.x = _currentDirection * itemHorizontalSpeed;
  }

  void _move(double dt) {
    if (velocity.y != 0) {
      velocity.y += gravity;
    }
    final newPosition = velocity * dt + position;
    position = newPosition;
  }

  void _removeWhenOutOfEdge() {
    if ((absolutePosition.x + size.x) <= 0 ||
        (absolutePosition.y - size.y) >= game.size.y) {
      removeFromParent();
    }
  }
}
