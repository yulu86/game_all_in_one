import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/segment/segment.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';

class StatefulGameObject<T> extends SpriteAnimationGroupComponent<T>
    with HasGameRef<MarioGame>, ParentIsA<Segment> {
  StatefulGameObject({
    required this.states,
    required this.initialState,
    required Vector2 size,
    this.gridPosition,
    super.position,
  }) : super(size: size * gameScale);

  final Map<T, GameObjectSpriteAnimation> states;
  final T initialState;
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

  void _setupPosition() {
    if (gridPosition != null) {
      position = Vector2(
        unitSize * gridPosition!.x,
        parent.size.y - unitSize * gridPosition!.y,
      );
    }
  }

  void _setupAnimations() {
    animations = _getAnimations();
    current = initialState;
  }

  Map<T, SpriteAnimation> _getAnimations() {
    final Map<T, SpriteAnimation> animations = {};
    states.forEach((state, animation) {
      animations.putIfAbsent(
        state,
        () => animation.getAnimation(gameRef.gameSpriteImage),
      );
    });
    return animations;
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

  void _removeWhenOutOfEdge() {
    if ((absolutePosition.x + size.x) <= 0 ||
        (absolutePosition.y - size.y) >= game.size.y) {
      removeFromParent();
    }
  }
}

class GameObjectSpriteAnimation {
  GameObjectSpriteAnimation({
    required this.size,
    required this.frames,
    this.stepTime = double.infinity,
  });

  final Vector2 size;
  final List<Vector2> frames;
  late double stepTime;

  SpriteAnimation getAnimation(Image image) {
    return SpriteAnimation.spriteList(
      frames
          .map(
            (vector) => Sprite(
              image,
              srcSize: size,
              srcPosition: vector,
            ),
          )
          .toList(),
      stepTime: stepTime,
    );
  }
}
