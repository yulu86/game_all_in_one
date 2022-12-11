import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/objects/actors/enemy/goomba.dart';
import 'package:game_all_in_one/src/objects/actors/player/player_state.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';

class Mario extends SpriteAnimationGroupComponent<int>
    with HasGameRef<MarioGame>, CollisionCallbacks {
  static final defaultSize = Vector2.all(16);

  Mario({
    required this.gridPosition,
  }) : super(
          anchor: Anchor.bottomLeft,
          size: defaultSize * gameScale,
        );

  final Vector2 gridPosition;

  PlayerState _playerState = PlayerState.waiting;
  PlayerMode _playerMode = PlayerMode.normal;

  @override
  Future<void>? onLoad() async {
    _addHitbox();

    // 设置动画
    _setupAnimations();

    // 设置位置
    _setupPosition();
  }

  @override
  void update(double dt) {
    _removeWhenOutOfEdge();
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Goomba) {
      current =
          getPlayerStatus(_playerState = PlayerState.crashed, _playerMode);
    }
    super.onCollision(intersectionPoints, other);
  }

  void _setupPosition() {
    position = Vector2(
      unitSize * gridPosition.x,
      game.size.y - unitSize * gridPosition.y,
    );
  }

  void _setupAnimations() {
    animations = _getAnimations();
    current = getPlayerStatus(_playerState, _playerMode);
  }

  Map<int, SpriteAnimation> _getAnimations() {
    return {
      // waiting & normal
      getPlayerStatus(PlayerState.waiting, PlayerMode.normal): _getAnimation(
        srcSize: defaultSize,
        frames: [Vector2(22, 507)],
      ),
      // crashed & normal
      getPlayerStatus(PlayerState.crashed, PlayerMode.normal): _getAnimation(
        srcSize: defaultSize,
        frames: [Vector2(45, 508)],
      ),
    };
  }

  void _addHitbox() {
    add(
      RectangleHitbox.relative(
        Vector2(1, 1),
        position: position,
        parentSize: size,
      )
        ..collisionType = CollisionType.active
        ..paint = hitboxPaint
        ..renderShape = renderHitboxShape,
    );
  }

  void _removeWhenOutOfEdge() {
    if ((absolutePosition.x + size.x) <= 0 ||
        (absolutePosition.y - size.y) >= game.size.y) {
      removeFromParent();
    }
  }

  SpriteAnimation _getAnimation({
    required Vector2 srcSize,
    required List<Vector2> frames,
    double stepTime = double.infinity,
  }) {
    return SpriteAnimation.spriteList(
      frames
          .map(
            (frame) => Sprite(
              game.gameSpriteImage,
              srcSize: srcSize,
              srcPosition: frame,
            ),
          )
          .toList(),
      stepTime: stepTime,
    );
  }
}
