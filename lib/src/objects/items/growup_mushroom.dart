import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/static_game_object.dart';

class GrowUpMushroom extends StaticGameObject {
  GrowUpMushroom({
    super.gridPosition,
    super.position,
  }) : super(
          srcSize: Vector2.all(16),
          srcPosition: Vector2(71, 43),
        );

  @override
  Future<void>? onLoad() async {
    addHitbox();
    return super.onLoad();
  }
}
