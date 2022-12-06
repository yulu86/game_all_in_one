import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:game_all_in_one/src/actors/goomba.dart';
import 'package:game_all_in_one/src/actors/mario.dart';
import 'package:game_all_in_one/src/game_controller.dart';
import 'package:game_all_in_one/src/objects/ground_brick.dart';

class MarioGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF7B93F1);

  @override
  Future<void>? onLoad() async {
    await Flame.images.load(marioGameImage);

    for (int i = 0; i < 100; i++) {
      add(GroundBrick(
        position: Vector2(32.0 * i, 182.0),
      ));
    }
    add(Goomba());
    add(Mario());
  }
}
