import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/utils/sprite_utils.dart';

class Mario extends SpriteAnimationComponent
    with KeyboardHandler, HasGameRef<MarioGame> {
  Mario() : super(size: Vector2.all(32), anchor: Anchor.bottomLeft);

  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;

  int horizontalDirection = 0;

  @override
  Future<void>? onLoad() async {
    animation = getAnimation(
      image: game.gameSpriteImage,
      size: Vector2.all(16),
      frames: [
        // Vector2(66, 508),
        Vector2(84, 507),
        Vector2(99, 508),
        Vector2(117, 507),
      ],
      stepTime: 0.12,
    );
    position = Vector2(290, game.size.y - 64);
  }

  @override
  void update(double dt) {
    velocity.x = horizontalDirection * moveSpeed;
    game.objectSpeed = 0;
    // Prevent ember from going backwards at screen edge.
    if (position.x - 36 <= 0 && horizontalDirection < 0) {
      velocity.x = 0;
    }
    // Prevent ember from going beyond half screen.
    if (position.x + 64 >= game.size.x / 2 && horizontalDirection > 0) {
      velocity.x = 0;
      game.objectSpeed = -moveSpeed / 50;
    }

    // Adjust ember position.
    position += velocity * dt;

    // Flip ember if needed.
    if (horizontalDirection < 0 && scale.x > 0) {
      flipHorizontally();
    } else if (horizontalDirection > 0 && scale.x < 0) {
      flipHorizontally();
    }
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalDirection = 0;
    horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyA) ||
            keysPressed.contains(LogicalKeyboardKey.arrowLeft))
        ? -1
        : 0;
    horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyD) ||
            keysPressed.contains(LogicalKeyboardKey.arrowRight))
        ? 1
        : 0;
    return true;
  }
}
