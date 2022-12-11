import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/objects/background/bush.dart';
import 'package:game_all_in_one/src/objects/background/cloud.dart';
import 'package:game_all_in_one/src/objects/background/hill.dart';
import 'package:game_all_in_one/src/objects/obstacle/ground_brick.dart';
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

  @override
  Future<void>? onLoad() {
    _setupPosition();
    _loadBlocks();
    return super.onLoad();
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
            gridPosition: block.gridPosition, objectSize: block.objectSize!));
        break;
      case Bush:
        add(Bush(
            gridPosition: block.gridPosition, objectSize: block.objectSize!));
        break;
      case Cloud:
        add(Cloud(
            gridPosition: block.gridPosition, objectSize: block.objectSize!));
        break;
    }
  }
}
