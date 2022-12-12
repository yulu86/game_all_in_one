import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/objects/actors/enemy/goomba.dart';
import 'package:game_all_in_one/src/objects/actors/player/player_state.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';

class Mario extends SpriteAnimationGroupComponent<int>
    with HasGameRef<MarioGame>, KeyboardHandler, CollisionCallbacks {
  static final defaultSize = Vector2.all(16);

  Mario({
    required this.gridPosition,
  }) : super(
          anchor: Anchor.bottomLeft,
          size: defaultSize * gameScale,
        );

  final Vector2 gridPosition;
  final speed = 500.0;

  final Vector2 _velocity = Vector2.zero();
  int _currentDirection = rightDirection;
  PlayerState _playerState = PlayerState.waiting;
  PlayerMode _playerMode = PlayerMode.normal;

  @override
  Future<void>? onLoad() async {
    _addHitbox();

    // 设置动画
    _setupAnimations();

    // 设置位置
    _setupPosition();
  }

  @override
  void update(double dt) {
    _updatePosition(dt);
    _removeWhenOutOfEdge();
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Goomba) {
      if (_playerState != PlayerState.crashed) {
        _crash();
      }
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _currentDirection = 0;
    _currentDirection += (keysPressed.contains(LogicalKeyboardKey.keyA) ||
            keysPressed.contains(LogicalKeyboardKey.arrowLeft))
        ? leftDirection
        : 0;
    _currentDirection += (keysPressed.contains(LogicalKeyboardKey.keyD) ||
            keysPressed.contains(LogicalKeyboardKey.arrowRight))
        ? rightDirection
        : 0;

    if (_currentDirection != 0) {
      current =
          getPlayerStatus(_playerState = PlayerState.running, _playerMode);
    }

    // hasJumped = keysPressed.contains(LogicalKeyboardKey.space);
    return true;
  }

  void _setupPosition() {
    position = Vector2(
      unitSize * gridPosition.x,
      game.size.y - unitSize * gridPosition.y,
    );
  }

  void _setupAnimations() {
    animations = _getAnimations();
    current = getPlayerStatus(_playerState, _playerMode);
  }

  Map<int, SpriteAnimation> _getAnimations() {
    return {
      // waiting & normal
      getPlayerStatus(PlayerState.waiting, PlayerMode.normal): _getAnimation(
        srcSize: defaultSize,
        frames: [Vector2(22, 507)],
      ),
      // crashed & normal
      getPlayerStatus(PlayerState.crashed, PlayerMode.normal): _getAnimation(
        srcSize: defaultSize,
        frames: [Vector2(45, 508)],
      ),
      // running & normal
      getPlayerStatus(PlayerState.running, PlayerMode.normal): _getAnimation(
        srcSize: defaultSize,
        frames: [
          Vector2(83, 507),
          Vector2(98, 508),
          Vector2(117, 507),
        ],
        stepTime: 0.12,
      ),
    };
  }

  void _addHitbox() {
    add(
      RectangleHitbox.relative(
        Vector2(1, 1),
        position: position,
        parentSize: size,
      )
        ..collisionType = CollisionType.active
        ..paint = hitboxPaint
        ..renderShape = renderHitboxShape,
    );
  }

  void _crash() {
    current = getPlayerStatus(_playerState = PlayerState.crashed, _playerMode);
    _velocity.x = 0;
    _velocity.y = -gravity * 15;
  }

  void _removeWhenOutOfEdge() {
    if ((absolutePosition.x + size.x) <= 0 ||
        (absolutePosition.y - size.y) >= game.size.y) {
      removeFromParent();
    }
  }

  void _updatePosition(double dt) {
    if (_playerState == PlayerState.crashed) {
      _velocity.x = 0;
      _velocity.y += gravity;
    } else if (_playerState == PlayerState.running) {
      _velocity.x = _currentDirection * 100;
    }
    position += _velocity * dt;
  }

  SpriteAnimation _getAnimation({
    required Vector2 srcSize,
    required List<Vector2> frames,
    double stepTime = double.infinity,
  }) {
    return SpriteAnimation.spriteList(
      frames
          .map(
            (frame) => Sprite(
              game.gameSpriteImage,
              srcSize: srcSize,
              srcPosition: frame,
            ),
          )
          .toList(),
      stepTime: stepTime,
    );
  }
}
