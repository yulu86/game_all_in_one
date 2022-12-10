import 'package:flame/components.dart';
import 'package:game_all_in_one/src/mario_game.dart';
import 'package:game_all_in_one/src/objects/obstacle/ground_brick.dart';

class Segment extends PositionComponent with HasGameRef<MarioGame> {
  Segment({required this.index})
      : super(
          anchor: Anchor.bottomLeft,
          size: Vector2(544, 408),
        );

  final int index;

  @override
  Future<void>? onLoad() {
    position = Vector2(index * size.x, game.size.y);
    for (int theIndex = 0; theIndex < 17; theIndex++) {
      final groundBrick =
          GroundBrick(gridPosition: Vector2(theIndex as double, 0));
      add(groundBrick);
    }
    return super.onLoad();
  }
}
