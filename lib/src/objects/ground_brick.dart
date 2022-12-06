import 'package:flame/components.dart';
import 'package:game_all_in_one/src/game_controller.dart';
import 'package:game_all_in_one/src/mario_game.dart';

class GroundBrick extends SpriteComponent with HasGameRef<MarioGame> {
  GroundBrick({required Vector2 position})
      : super(
          size: Vector2.all(32),
          position: position,
        );

  @override
  Future<void>? onLoad() async {
    sprite = getSprite(
      image: game.gameSpriteImage,
      size: Vector2.all(16),
      position: Vector2(373, 124),
    );
  }
}
