import 'package:flame/components.dart';
import 'package:game_all_in_one/src/objects/stateful_game_object.dart';

enum QuestionBrickState {
  unused,
  used,
}

class QuestionBrick extends StatefulGameObject<QuestionBrickState> {
  QuestionBrick({
    super.gridPosition,
    this.item,
  }) : super(
          states: {
            QuestionBrickState.unused: GameObjectSpriteAnimation(
              size: Vector2.all(16),
              frames: [
                Vector2(372, 160),
                Vector2(390, 160),
                Vector2(408, 160),
              ],
              stepTime: 0.25,
            ),
            QuestionBrickState.used: GameObjectSpriteAnimation(
              size: Vector2.all(16),
              frames: [Vector2(373, 65)],
            ),
          },
          initialState: QuestionBrickState.unused,
          size: Vector2.all(16),
        );

  final Type? item;

  @override
  Future<void>? onLoad() {
    addHitbox();
    return super.onLoad();
  }
}
