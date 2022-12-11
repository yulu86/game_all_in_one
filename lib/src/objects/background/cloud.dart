import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/background/object_size.dart';
import 'package:game_all_in_one/src/objects/static_game_object.dart';

/// 云朵
class Cloud extends StaticGameObject {
  Cloud({
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
        return Vector2(64, 24);
      case ObjectSize.medium:
        return Vector2(48, 24);
      case ObjectSize.small:
        return Vector2(32, 24);
    }
  }

  static Vector2 _getSrcPosition(ObjectSize objectSize) {
    switch (objectSize) {
      case ObjectSize.large:
        return Vector2(96, 198);
      case ObjectSize.medium:
        return Vector2(46, 198);
      case ObjectSize.small:
        return Vector2(162, 198);
    }
  }
}
