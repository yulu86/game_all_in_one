import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/objects/stateful_game_object.dart';
import 'package:game_all_in_one/src/segment/segment.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';

class AnimationGameObject extends SpriteAnimationComponent
    with HasGameRef<MarioGame>, ParentIsA<Segment> {
  AnimationGameObject({
    required this.spriteAnimation,
    required Vector2 size,
    this.gridPosition,
    super.position,
  }) : super(
          anchor: Anchor.bottomLeft,
          size: size * gameScale,
        );

  final GameObjectSpriteAnimation spriteAnimation;

  Vector2? gridPosition;

  @override
  Future<void>? onLoad() async {
    // 设置动画
    _setupAnimations();

    // 设置位置
    _setupPosition();
  }

  @override
  void update(double dt) {
    _removeWhenOutOfEdge();
    super.update(dt);
  }

  void _setupAnimations() {
    animation = spriteAnimation.getAnimation(game.gameSpriteImage);
  }

  void _setupPosition() {
    if (gridPosition != null) {
      position = Vector2(
        unitSize * gridPosition!.x,
        parent.size.y - unitSize * gridPosition!.y,
      );
    }
  }

  void _removeWhenOutOfEdge() {
    if ((absolutePosition.x + size.x) <= 0 ||
        (absolutePosition.y - size.y) >= game.size.y) {
      removeFromParent();
    }
  }

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
}
