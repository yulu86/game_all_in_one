import 'package:flame/components.dart';
import 'package:game_all_in_one/src/game_controller.dart';
import 'package:game_all_in_one/src/mario_game.dart';

class Cloud extends SpriteComponent with HasGameRef<MarioGame> {
  Cloud()
      : super(
          size: Vector2(96, 48),
          position: Vector2(160, 350),
          anchor: Anchor.bottomLeft,
        );

  @override
  Future<void>? onLoad() async {
    sprite = getSprite(
      image: game.gameSpriteImage,
      size: Vector2(48, 24),
      position: Vector2(46, 198),
    );
  }
}
