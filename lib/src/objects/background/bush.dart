import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/background/object_size.dart';
import 'package:game_all_in_one/src/objects/game_object.dart';

/// 灌木丛
class Bush extends GameObject {
  Bush({
    super.position,
    super.gridPosition,
    ObjectSize objectSize = ObjectSize.small,
  }) : super(
          srcSize: _getSrcSize(objectSize),
          srcPosition: _getSrcPosition(objectSize),
        );

  static Vector2 _getSrcSize(ObjectSize objectSize) {
    switch (objectSize) {
      case ObjectSize.large:
        return Vector2(64, 16);
      case ObjectSize.medium:
        return Vector2(48, 16);
      case ObjectSize.small:
        return Vector2(32, 16);
    }
  }

  static Vector2 _getSrcPosition(ObjectSize objectSize) {
    switch (objectSize) {
      case ObjectSize.large:
        return Vector2(85, 253);
      case ObjectSize.medium:
        return Vector2(151, 253);
      case ObjectSize.small:
        return Vector2(51, 253);
    }
  }
}
