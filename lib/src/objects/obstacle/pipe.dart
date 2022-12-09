import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/utils/sprite_utils.dart';

class Pipe extends SpriteComponent with HasGameRef<MarioGame> {
  Pipe() : super(size: Vector2(64, 64), anchor: Anchor.bottomLeft);

  @override
  Future<void>? onLoad() async {
    sprite = getSprite(
      image: game.gameSpriteImage,
      size: Vector2(32, 32),
      position: Vector2(614, 46),
    );
    position = Vector2(320, game.size.y - 64);
  }
}
