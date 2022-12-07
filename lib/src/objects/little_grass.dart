import 'package:flame/components.dart';
import 'package:game_all_in_one/src/game_controller.dart';
import 'package:game_all_in_one/src/mario_game.dart';

class LittleGrass extends SpriteComponent with HasGameRef<MarioGame> {
  LittleGrass() : super(size: Vector2(96, 38), anchor: Anchor.bottomLeft);

  @override
  Future<void>? onLoad() async {
    sprite = getSprite(
      image: game.gameSpriteImage,
      size: Vector2(48, 19),
      position: Vector2(48, 176),
    );
    position = Vector2(160, game.size.y - 32);
  }
}
