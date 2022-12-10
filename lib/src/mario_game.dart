import 'dart:ui';

import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:game_all_in_one/src/actors/enemy/goomba.dart';
import 'package:game_all_in_one/src/actors/player/mario.dart';
import 'package:game_all_in_one/src/objects/background/bush.dart';
import 'package:game_all_in_one/src/objects/background/cloud.dart';
import 'package:game_all_in_one/src/objects/background/hill.dart';
import 'package:game_all_in_one/src/objects/background/object_size.dart';
import 'package:game_all_in_one/src/objects/obstacle/ground_brick.dart';
import 'package:game_all_in_one/src/objects/obstacle/pipe.dart';
import 'package:game_all_in_one/src/segment/segment.dart';
import 'package:game_all_in_one/src/segment/segment_manager.dart';

import 'utils/game_const.dart';

class MarioGame extends FlameGame with HasKeyboardHandlerComponents {
  double objectSpeed = 0;

  @override
  Color backgroundColor() => const Color(0xFF7B93F1);

  late Image gameSpriteImage;

  @override
  // TODO: implement debugMode
  bool get debugMode => true;

  @override
  Future<void>? onLoad() async {
    gameSpriteImage = await Flame.images.load(marioGameImage);

    // for (int i = 0; i < 100; i++) {
    //   addAll([
    //     GroundBrick(
    //       position: Vector2(32.0 * i, size.y),
    //     ),
    //     GroundBrick(
    //       position: Vector2(32.0 * i, size.y - 32),
    //     ),
    //   ]);
    // }
    // add(Bush(position: Vector2(30, size.y - 64)));
    // add(Cloud(position: Vector2(160, 350)));
    // add(Hill(
    //   position: Vector2(160, size.y - 64),
    //   objectSize: ObjectSize.large,
    // ));
    // add(Pipe(position: Vector2(320, size.y - 64)));
    // add(Goomba());
    // add(Mario());
    // add(Segment(index: 1,blocks: ));
    _loadSegments();
  }

  void _loadSegments() {
    for (final segment in segments) {
      add(segment);
    }
  }
}
