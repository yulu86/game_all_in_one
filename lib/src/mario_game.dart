import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:game_all_in_one/src/actors/goomba.dart';

class MarioGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF7B93F1);

  @override
  Future<void>? onLoad() async {
    await Flame.images.load('mario_sprites.gif');

    add(Goomba());
  }
}
