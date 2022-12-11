import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/static_game_object.dart';

class GroundBrick extends StaticGameObject {
  GroundBrick({super.position, super.gridPosition})
      : super(
          srcSize: Vector2.all(16),
          srcPosition: Vector2(373, 124),
        );

  @override
  Future<void>? onLoad() async {
    addHitbox();
    return super.onLoad();
  }
}
