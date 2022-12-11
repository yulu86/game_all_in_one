import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/actors/enemy/goomba.dart';
import 'package:game_all_in_one/src/objects/background/cloud.dart';
import 'package:game_all_in_one/src/objects/background/hill.dart';
import 'package:game_all_in_one/src/objects/background/object_size.dart';
import 'package:game_all_in_one/src/objects/items/flipping_coin.dart';
import 'package:game_all_in_one/src/objects/items/growup_mushroom.dart';
import 'package:game_all_in_one/src/objects/obstacle/brick.dart';
import 'package:game_all_in_one/src/objects/obstacle/pipe.dart';
import 'package:game_all_in_one/src/objects/obstacle/qustion_brick.dart';
import 'package:game_all_in_one/src/segment/segment.dart';
import 'package:game_all_in_one/src/segment/segment_block.dart';

class Segment1 extends Segment {
  Segment1() : super(index: 1);

  @override
  List<SegmentBlock> getBlocks() {
    final blocks = buildGroundBricks(17);
    blocks.addAll(_buildBackgrounds());
    blocks.addAll(_buildObstacles());
    blocks.addAll(_buildEnemies());
    return blocks;
  }

  List<SegmentBlock> _buildBackgrounds() {
    return [
      SegmentBlock(
        gridPosition: Vector2(0, 2),
        blockType: Hill,
        objectSize: ObjectSize.medium,
      ),
      SegmentBlock(
        gridPosition: Vector2(4, 10),
        blockType: Cloud,
        objectSize: ObjectSize.small,
      ),
      SegmentBlock(
        gridPosition: Vector2(11, 8),
        blockType: Cloud,
        objectSize: ObjectSize.large,
      ),
    ];
  }

  List<SegmentBlock> _buildObstacles() {
    return [
      SegmentBlock(
        gridPosition: Vector2(0, 5),
        blockType: QuestionBrick,
        item: FlippingCoin,
      ),
      SegmentBlock(
        gridPosition: Vector2(4, 5),
        blockType: Brick,
      ),
      SegmentBlock(
        gridPosition: Vector2(5, 5),
        blockType: QuestionBrick,
        item: FlippingCoin,
      ),
      SegmentBlock(
        gridPosition: Vector2(6, 5),
        blockType: Brick,
      ),
      SegmentBlock(
        gridPosition: Vector2(7, 5),
        blockType: QuestionBrick,
        item: GrowUpMushroom,
      ),
      SegmentBlock(
        gridPosition: Vector2(8, 5),
        blockType: Brick,
      ),
      SegmentBlock(
        gridPosition: Vector2(6, 7),
        blockType: QuestionBrick,
        item: FlippingCoin,
      ),
      SegmentBlock(
        gridPosition: Vector2(11, 2),
        blockType: Pipe,
        objectSize: ObjectSize.small,
      ),
    ];
  }

  List<SegmentBlock> _buildEnemies() {
    return [
      SegmentBlock(
        gridPosition: Vector2(6, 2),
        blockType: Goomba,
      )
    ];
  }
}
