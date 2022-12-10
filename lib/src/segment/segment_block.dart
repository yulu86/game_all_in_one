import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/background/object_size.dart';

class SegmentBlock {
  SegmentBlock({
    required this.gridPosition,
    required this.blockType,
    this.objectSize,
  });

  final Vector2 gridPosition;
  final Type blockType;
  final ObjectSize? objectSize;
}
