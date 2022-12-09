import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';
import 'package:game_all_in_one/src/utils/sprite_utils.dart';

class GameObject extends SpriteComponent with HasGameRef<MarioGame> {
  GameObject({
    required Vector2 position,
    required Vector2 srcSize,
    required Vector2 srcPosition,
  }) : super(
          position: position,
          anchor: Anchor.bottomLeft,
        ) {
    _srcSize = srcSize;
    _srcPosition = srcPosition;
  }

  late Vector2 _srcSize;
  late Vector2 _srcPosition;

  @override
  Future<void>? onLoad() async {
    sprite = getSprite(
      image: game.gameSpriteImage,
      size: _srcSize,
      position: _srcPosition,
    );
    size = _srcSize * gameScale;
  }
}
