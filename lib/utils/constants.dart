import 'dart:ui';

import 'package:flame/components.dart';

final class GameConstant {
  static const double cardGap = 175;
  static const double cardWidth = 1000;
  static const double cardHeight = 1400;
  static const double cardRadius = 100;
  static final Vector2 cardSize = Vector2(cardWidth, cardHeight);
  static final cardRRect = RRect.fromRectAndRadius(
    const Rect.fromLTWH(0, 0, cardWidth, cardHeight),
    const Radius.circular(cardRadius),
  );
}
