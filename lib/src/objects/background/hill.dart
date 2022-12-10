import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/background/object_size.dart';
import 'package:game_all_in_one/src/objects/game_object.dart';

/// 山丘
class Hill extends GameObject {
  Hill({
    required Vector2 position,
    ObjectSize objectSize = ObjectSize.medium,
  }) : super(
          position: position,
          srcSize: _getSrcSize(objectSize),
          srcPosition: _getSrcPosition(objectSize),
        );

  static Vector2 _getSrcSize(ObjectSize objectSize) {
    if (objectSize == ObjectSize.large) {
      return Vector2(80, 35);
    }
    return Vector2(48, 19);
  }

  static Vector2 _getSrcPosition(ObjectSize objectSize) {
    if (objectSize == ObjectSize.large) {
      return Vector2(99, 160);
    }
    return Vector2(48, 176);
  }
}
