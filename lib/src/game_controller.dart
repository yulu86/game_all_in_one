import 'dart:ui';

import 'package:flame/components.dart';

/// 精灵图
const marioGameImage = 'mario_sprites.gif';

/// 单元大小
const unitSize = 32.0;

/// 获取精灵图
Sprite getSprite({
  required Image image,
  required Vector2 size,
  required Vector2 position,
}) {
  return Sprite(
    image,
    srcSize: size,
    srcPosition: position,
  );
}

/// 获取精灵动画
SpriteAnimation getAnimation({
  required Image image,
  required Vector2 size,
  required List<Vector2> frames,
  double stepTime = double.infinity,
}) {
  final sprites = frames
      .map((srcPosition) => Sprite(
            image,
            srcSize: size,
            srcPosition: srcPosition,
          ))
      .toList();
  return SpriteAnimation.spriteList(
    sprites,
    stepTime: stepTime,
  );
}
