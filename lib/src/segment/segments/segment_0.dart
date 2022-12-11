import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/background/bush.dart';
import 'package:game_all_in_one/src/objects/background/cloud.dart';
import 'package:game_all_in_one/src/objects/background/hill.dart';
import 'package:game_all_in_one/src/objects/background/object_size.dart';
import 'package:game_all_in_one/src/segment/segment.dart';
import 'package:game_all_in_one/src/segment/segment_block.dart';

class Segment0 extends Segment {
  Segment0() : super(index: 0);

  @override
  List<SegmentBlock> getBlocks() {
    final blocks = buildGroundBricks(17);
    blocks.addAll(_buildBackgrounds());
    return blocks;
  }

  List<SegmentBlock> _buildBackgrounds() {
    return [
      SegmentBlock(
        gridPosition: Vector2(2, 2),
        blockType: Hill,
        objectSize: ObjectSize.large,
      ),
      SegmentBlock(
        gridPosition: Vector2(13, 2),
        blockType: Bush,
        objectSize: ObjectSize.large,
      ),
      SegmentBlock(
        gridPosition: Vector2(12, 8),
        blockType: Cloud,
        objectSize: ObjectSize.small,
      ),
    ];
  }
}
