import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/objects/obstacle/ground_brick.dart';
import 'package:game_all_in_one/src/segment/segment_block.dart';
import 'package:game_all_in_one/src/utils/game_const.dart';

class Segment extends PositionComponent with HasGameRef<MarioGame> {
  static final defaultSize = Vector2(272, 204);

  Segment({
    required this.index,
    required this.blocks,
  }) : super(
          anchor: Anchor.bottomLeft,
          size: defaultSize * gameScale,
        );

  final int index;
  final List<SegmentBlock> blocks;

  @override
  Future<void>? onLoad() {
    _setupPosition();
    // for (int theIndex = 0; theIndex < 17; theIndex++) {
    //   final groundBrick =
    //       GroundBrick(gridPosition: Vector2(theIndex as double, 0));
    //   add(groundBrick);
    // }
    _loadBlocks();
    return super.onLoad();
  }

  void _setupPosition() {
    position = Vector2(index * size.x, game.size.y);
  }

  void _loadBlocks() {
    for (final block in blocks) {
      switch (block.blockType) {
        case GroundBrick:
          add(GroundBrick(gridPosition: block.gridPosition));
          break;
      }
    }
  }
}
