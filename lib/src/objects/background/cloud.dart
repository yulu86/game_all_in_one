import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/game_object.dart';

class Cloud extends GameObject {
  Cloud({required Vector2 position})
      : super(
          position: position,
          srcSize: Vector2(48, 24),
          srcPosition: Vector2(46, 198),
        );
}
