import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:game_all_in_one/src/objects/actors/player/mario.dart';
import 'package:game_all_in_one/src/segment/segment_manager.dart';

import 'utils/game_const.dart';

class MarioGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  double objectSpeed = 0;

  @override
  Color backgroundColor() => const Color(0xFF7B93F1);

  late Image gameSpriteImage;

  @override
  bool get debugMode => false;

  @override
  void onGameResize(Vector2 canvasSize) {
    setGameScale(canvasSize.x);
    super.onGameResize(canvasSize);
  }

  @override
  Future<void>? onLoad() async {
    gameSpriteImage = await Flame.images.load(marioGameImage);

    add(ScreenHitbox());
    _loadSegments();

    add(Mario(gridPosition: Vector2(2, 2)));
  }

  void _loadSegments() {
    for (final segment in segments) {
      add(segment);
    }
  }
}
