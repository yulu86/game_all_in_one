import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';

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

  Vector2 velocity = Vector2.zero();

  @override
  Future<void>? onLoad() async {
    sprite = _getSprite(
      size: _srcSize,
      position: _srcPosition,
    );
    size = _srcSize * gameScale;
  }

  @override
  void update(double dt) {
    velocity.x = game.objectSpeed;
    position += velocity;

    super.update(dt);
  }

  // 获取精灵图
  Sprite _getSprite({
    required Vector2 size,
    required Vector2 position,
  }) {
    return Sprite(
      game.gameSpriteImage,
      srcSize: size,
      srcPosition: position,
    );
  }
}
