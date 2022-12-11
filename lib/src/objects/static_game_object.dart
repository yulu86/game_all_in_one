import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/animation_game_object.dart';
import 'package:game_all_in_one/src/objects/stateful_game_object.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';

class StaticGameObject extends AnimationGameObject {
  StaticGameObject({
    required Vector2 srcSize,
    required Vector2 srcPosition,
    super.gridPosition,
    super.position,
  }) : super(
          spriteAnimation: GameObjectSpriteAnimation(
            size: srcSize,
            frames: [srcPosition],
          ),
          size: srcSize,
        );

  void addHitbox({CollisionType collisionType = CollisionType.passive}) {
    add(
      RectangleHitbox.relative(
        Vector2(1, 1),
        position: position,
        parentSize: size,
      )
        ..collisionType = collisionType
        ..paint = hitboxPaint
        ..renderShape = renderHitboxShape,
    );
  }

  @override
  void update(double dt) {
    _removeWhenOutOfEdge();
    super.update(dt);
  }

  void _removeWhenOutOfEdge() {
    if ((absolutePosition.x + size.x) <= 0 ||
        (absolutePosition.y - size.y) >= game.size.y) {
      removeFromParent();
    }
  }
}
