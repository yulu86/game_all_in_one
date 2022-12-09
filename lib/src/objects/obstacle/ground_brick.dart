import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';
import 'package:game_all_in_one/src/utils/sprite_utils.dart';

class GroundBrick extends SpriteComponent with HasGameRef<MarioGame> {
  GroundBrick({required Vector2 position})
      : super(
          position: position,
          anchor: Anchor.bottomLeft,
        );

  @override
  Future<void>? onLoad() async {
    final srcSize = Vector2.all(16);
    sprite = getSprite(
      image: game.gameSpriteImage,
      size: Vector2.all(16),
      position: Vector2(373, 124),
    );
    size = srcSize * gameScale;
  }
}
