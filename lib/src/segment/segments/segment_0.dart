import 'package:game_all_in_one/src/segment/segment.dart';
import 'package:game_all_in_one/src/segment/segment_block.dart';

class Segment0 extends Segment {
  Segment0() : super(index: 0);

  @override
  List<SegmentBlock> getBlocks() {
    var result = buildGroundBricks(17);
    return result;
  }
}
