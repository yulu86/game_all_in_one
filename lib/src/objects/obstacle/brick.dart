import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/stateful_game_object.dart';

enum BrickState {
  normal,
  crashed,
}

class Brick extends StatefulGameObject<BrickState> {
  Brick({super.gridPosition})
      : super(
          states: {
            BrickState.normal: GameObjectSpriteAnimation(
              size: Vector2.all(16),
              frames: [Vector2(373, 47)],
            ),
          },
          initialState: BrickState.normal,
          size: Vector2.all(16),
        );

  @override
  Future<void>? onLoad() async {
    addHitbox();
    return super.onLoad();
  }
}
