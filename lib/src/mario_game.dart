import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
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
  Future<void>? onLoad() async {
    gameSpriteImage = await Flame.images.load(marioGameImage);
    setGameScale(size.x);

    add(ScreenHitbox());
    _loadSegments();
  }

  void _loadSegments() {
    for (final segment in segments) {
      add(segment);
    }
  }
}
