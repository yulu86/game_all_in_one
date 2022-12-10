import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/obstacle/ground_brick.dart';
import 'package:game_all_in_one/src/segment/segment.dart';
import 'package:game_all_in_one/src/segment/segment_block.dart';

final segments = [
  segment0,
];

final segment0 = Segment(
  index: 1,
  blocks: _buildGroundBricks(17),
);

List<SegmentBlock> _buildGroundBricks(int colSize) {
  List<SegmentBlock> result = [];
  result.addAll(_buildGroundBrick(colSize, 0));
  result.addAll(_buildGroundBrick(colSize, 1));
  return result;
}

List<SegmentBlock> _buildGroundBrick(int colSize, int row) {
  return List.generate(
    colSize,
    (index) => SegmentBlock(
      gridPosition: Vector2(index as double, row as double),
      blockType: GroundBrick,
    ),
  ).toList();
}
