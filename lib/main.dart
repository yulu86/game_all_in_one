import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_all_in_one/src/mario_game.dart';

void main() {
  final Game game = MarioGame();
  runApp(GameWidget(game: game));
}
