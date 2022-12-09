import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/game_object.dart';

class Pipe extends GameObject {
  Pipe({required Vector2 position})
      : super(
          position: position,
          srcSize: Vector2.all(32),
          srcPosition: Vector2(614, 46),
        );
}
