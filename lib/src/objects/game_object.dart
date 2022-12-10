import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/segment/segment.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';

class GameObject extends SpriteComponent
    with HasGameRef<MarioGame>, ParentIsA<Segment> {
  GameObject({
    required Vector2 srcSize,
    required Vector2 srcPosition,
    this.gridPosition,
    super.position,
  }) : super(
          anchor: Anchor.bottomLeft,
        ) {
    _srcSize = srcSize;
    _srcPosition = srcPosition;
    size = _srcSize * gameScale;
  }

  late Vector2 _srcSize;
  late Vector2 _srcPosition;
  Vector2? gridPosition;

  Vector2 velocity = Vector2.zero();

  @override
  Future<void>? onLoad() async {
    sprite = _getSprite(
      size: _srcSize,
      position: _srcPosition,
    );

    if (gridPosition != null) {
      position = Vector2(
        size.x * gridPosition!.x,
        parent.size.y - size.y * gridPosition!.y,
      );
    }
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
