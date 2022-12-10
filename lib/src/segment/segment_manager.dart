import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/obstacle/ground_brick.dart';
import 'package:game_all_in_one/src/segment/segment.dart';
import 'package:game_all_in_one/src/segment/segment_block.dart';

final segments = [
  segment0,
];

final segment0 = Segment(
  index: 1,
  blocks: [
    SegmentBlock(gridPosition: Vector2(0, 0), blockType: GroundBrick),
    SegmentBlock(gridPosition: Vector2(0, 1), blockType: GroundBrick),
    SegmentBlock(gridPosition: Vector2(1, 0), blockType: GroundBrick),
    SegmentBlock(gridPosition: Vector2(1, 1), blockType: GroundBrick),
    SegmentBlock(gridPosition: Vector2(2, 0), blockType: GroundBrick),
    SegmentBlock(gridPosition: Vector2(2, 1), blockType: GroundBrick),
    SegmentBlock(gridPosition: Vector2(3, 0), blockType: GroundBrick),
    SegmentBlock(gridPosition: Vector2(3, 1), blockType: GroundBrick),
    SegmentBlock(gridPosition: Vector2(4, 0), blockType: GroundBrick),
    SegmentBlock(gridPosition: Vector2(4, 1), blockType: GroundBrick),
    SegmentBlock(gridPosition: Vector2(5, 0), blockType: GroundBrick),
    SegmentBlock(gridPosition: Vector2(5, 1), blockType: GroundBrick),
  ],
);
