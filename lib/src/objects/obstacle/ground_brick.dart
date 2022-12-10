import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/game_object.dart';

class GroundBrick extends GameObject {
  GroundBrick({super.position, super.gridPosition})
      : super(
          srcSize: Vector2.all(16),
          srcPosition: Vector2(373, 124),
        );
}
