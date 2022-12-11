import 'dart:ui';

import 'package:flame/palette.dart';

/// 精灵图
const marioGameImage = 'mario_sprites.gif';

/// 缩放大小
const gameScale = 4.5;

/// 单元大小
const unitSize = 16.0 * gameScale;

/// 重力
const double gravity = 1;

/// 向左移动
const int leftDirection = -1;

/// 向右移动
const int rightDirection = 1;

/// 物品水平移动速度
const double itemHorizontalSpeed = 1;

final hitboxPaint = BasicPalette.yellow.paint()..style = PaintingStyle.stroke;
const renderHitboxShape = true;
