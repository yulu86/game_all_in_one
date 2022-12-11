import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/background/object_size.dart';
import 'package:game_all_in_one/src/objects/static_game_object.dart';

class Pipe extends StaticGameObject {
  Pipe({
    super.position,
    super.gridPosition,
    ObjectSize objectSize = ObjectSize.small,
  }) : super(
          srcSize: Vector2.all(32),
          srcPosition: Vector2(614, 46),
        );

  static Vector2 _getSrcSize(ObjectSize objectSize) {
    return Vector2.all(32);
    switch (objectSize) {
      case ObjectSize.small:
        return Vector2.all(32);
    }
  }

  static Vector2 _getSrcPosition(ObjectSize objectSize) {
    return Vector2(614, 46);
    switch (objectSize) {
      case ObjectSize.small:
        return Vector2(614, 46);
    }
  }
}
