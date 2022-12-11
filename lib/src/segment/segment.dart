import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/objects/background/bush.dart';
import 'package:game_all_in_one/src/objects/background/cloud.dart';
import 'package:game_all_in_one/src/objects/background/hill.dart';
import 'package:game_all_in_one/src/objects/obstacle/brick.dart';
import 'package:game_all_in_one/src/objects/obstacle/ground_brick.dart';
import 'package:game_all_in_one/src/objects/obstacle/pipe.dart';
import 'package:game_all_in_one/src/segment/segment_block.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';

abstract class Segment extends PositionComponent with HasGameRef<MarioGame> {
  static final defaultSize = Vector2(272, 204);
  static const brickColSize = 17;

  Segment({
    required this.index,
  }) : super(
          anchor: Anchor.bottomLeft,
          size: defaultSize * gameScale,
        );

  final int index;
  final Vector2 velocity = Vector2.zero();

  @override
  Future<void>? onLoad() {
    // 设置位置
    _setupPosition();

    // 加载block
    _loadBlocks();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // 水平滚动
    _scroll();

    super.update(dt);
  }

  List<SegmentBlock> getBlocks();

  List<SegmentBlock> buildGroundBricks(int colSize) {
    List<SegmentBlock> result = [];
    result.addAll(buildGroundBrick(colSize, 0));
    result.addAll(buildGroundBrick(colSize, 1));
    return result;
  }

  List<SegmentBlock> buildGroundBrick(int colSize, int row) {
    return List.generate(
      colSize,
      (index) => SegmentBlock(
        gridPosition: Vector2(index as double, row as double),
        blockType: GroundBrick,
      ),
    ).toList();
  }

  void _scroll() {
    velocity.x = game.objectSpeed;
    position += velocity;
  }

  void _setupPosition() {
    position = Vector2(index * size.x, game.size.y);
  }

  void _loadBlocks() {
    final blocks = getBlocks();
    for (final block in blocks) {
      _loadBlock(block);
    }
  }

  void _loadBlock(SegmentBlock block) {
    switch (block.blockType) {
      case GroundBrick:
        add(GroundBrick(gridPosition: block.gridPosition));
        break;
      case Hill:
        add(Hill(
          gridPosition: block.gridPosition,
          objectSize: block.objectSize!,
        ));
        break;
      case Bush:
        add(Bush(
          gridPosition: block.gridPosition,
          objectSize: block.objectSize!,
        ));
        break;
      case Cloud:
        add(Cloud(
          gridPosition: block.gridPosition,
          objectSize: block.objectSize!,
        ));
        break;
      case Pipe:
        add(Pipe(
          gridPosition: block.gridPosition,
          objectSize: block.objectSize!,
        ));
        break;
      case Brick:
        add(Brick(
          gridPosition: block.gridPosition,
        ));
        break;
    }
  }
}
