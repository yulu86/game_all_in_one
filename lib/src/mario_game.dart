import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:game_all_in_one/src/actors/goomba.dart';
import 'package:game_all_in_one/src/actors/mario.dart';
import 'package:game_all_in_one/src/game_controller.dart';
import 'package:game_all_in_one/src/objects/ground_brick.dart';

class MarioGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF7B93F1);

  late Image gameSpriteImage;

  @override
  Future<void>? onLoad() async {
    gameSpriteImage = await Flame.images.load(marioGameImage);

    for (int i = 0; i < 100; i++) {
      add(GroundBrick(
        position: Vector2(32.0 * i, 182.0),
      ));
    }
    add(Goomba());
    add(Mario());
  }

  Sprite getSprite({
    required Vector2 size,
    required Vector2 position,
  }) {
    return Sprite(
      gameSpriteImage,
      srcSize: size,
      srcPosition: position,
    );
  }

  /// 获取精灵动画
  SpriteAnimation getAnimation({
    required Vector2 size,
    required List<Vector2> frames,
    double stepTime = double.infinity,
  }) {
    final sprites = frames
        .map((srcPosition) => Sprite(
              gameSpriteImage,
              srcSize: size,
              srcPosition: srcPosition,
            ))
        .toList();
    return SpriteAnimation.spriteList(
      sprites,
      stepTime: stepTime,
    );
  }
}
