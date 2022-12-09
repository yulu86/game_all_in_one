import 'dart:ui';

import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:game_all_in_one/src/actors/enemy/goomba.dart';
import 'package:game_all_in_one/src/actors/player/mario.dart';
import 'package:game_all_in_one/src/objects/background/cloud.dart';
import 'package:game_all_in_one/src/objects/obstacle/ground_brick.dart';
import 'package:game_all_in_one/src/objects/background/little_grass.dart';
import 'package:game_all_in_one/src/objects/obstacle/pipe.dart';

import 'utils/game_const.dart';

class MarioGame extends FlameGame with HasKeyboardHandlerComponents {
  double objectSpeed = 0;

  @override
  Color backgroundColor() => const Color(0xFF7B93F1);

  late Image gameSpriteImage;

  @override
  Future<void>? onLoad() async {
    gameSpriteImage = await Flame.images.load(marioGameImage);

    for (int i = 0; i < 100; i++) {
      addAll([
        GroundBrick(
          position: Vector2(32.0 * i, size.y),
        ),
        GroundBrick(
          position: Vector2(32.0 * i, size.y - 32),
        ),
      ]);
    }
    add(Cloud(position: Vector2(160, 350)));
    add(LittleGrass(position: Vector2(160, size.y - 64)));
    add(Pipe(position: Vector2(320, size.y - 64)));
    add(Goomba());
    add(Mario());
  }
}
