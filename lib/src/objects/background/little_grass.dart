import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/game_object.dart';

class LittleGrass extends GameObject {
  LittleGrass({required Vector2 position})
      : super(
          position: position,
          srcSize: Vector2(48, 19),
          srcPosition: Vector2(48, 176),
        );
}
