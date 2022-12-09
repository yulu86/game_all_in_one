import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';
import 'package:game_all_in_one/src/utils/sprite_utils.dart';

class Pipe extends SpriteComponent with HasGameRef<MarioGame> {
  Pipe({required Vector2 position})
      : super(
          position: position,
          anchor: Anchor.bottomLeft,
        );

  @override
  Future<void>? onLoad() async {
    final srcSize = Vector2(32, 32);
    sprite = getSprite(
      image: game.gameSpriteImage,
      size: srcSize,
      position: Vector2(614, 46),
    );
    size = srcSize * gameScale;
  }
}
