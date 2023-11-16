import 'dart:async';
import 'dart:math';

import 'package:arrugas/hub/main_screen.dart';
import 'package:arrugas/objects/card.dart';
import 'package:arrugas/objects/foundation.dart';

import 'package:arrugas/objects/stock.dart';
import 'package:arrugas/objects/tableau_pile.dart';
import 'package:arrugas/objects/waste.dart';
import 'package:arrugas/utils/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import 'package:flame/game.dart';
import 'package:flutter/widgets.dart' show runApp;

void main() {
  runApp(GameWidget(
    game: Arrugas(),
    overlayBuilderMap: {'Main': (_, game) => const MainScreen()},
    initialActiveOverlays: const ['Main'],
  ));
}

class Arrugas extends FlameGame {
  @override
  Future<void> onLoad() async {
    await Flame.images.load('klondike-sprites.png');

    final stock =
        Stock(position: Vector2(GameConstant.cardGap, GameConstant.cardGap));

    final waste = Waste(
        position: Vector2(GameConstant.cardWidth + 2 * GameConstant.cardGap,
            GameConstant.cardGap));

    final foundations = List.generate(
      4,
      (i) => Foundation(
        i,
        position: Vector2(
            (i + 3) * (GameConstant.cardWidth + GameConstant.cardGap) +
                GameConstant.cardGap,
            GameConstant.cardGap),
      ),
    );

    final piles = List.generate(
      7,
      (i) => TableauPile()
        ..size = GameConstant.cardSize
        ..position = Vector2(
          GameConstant.cardGap +
              i * (GameConstant.cardWidth + GameConstant.cardGap),
          GameConstant.cardHeight + 2 * GameConstant.cardGap,
        ),
    );

    world.add(stock);
    world.add(waste);
    world.addAll(foundations);
    world.addAll(piles);

    //Camara
    camera.viewfinder.visibleGameSize = Vector2(
        GameConstant.cardWidth * 7 + GameConstant.cardGap * 8,
        4 * GameConstant.cardHeight + 3 * GameConstant.cardGap);
    camera.viewfinder.position =
        Vector2(GameConstant.cardWidth * 3.5 + GameConstant.cardGap * 4, 0);
    camera.viewfinder.anchor = Anchor.topCenter;

    final random = Random();
    for (var i = 0; i < 7; i++) {
      for (var j = 0; j < 4; j++) {
        final card = Card(random.nextInt(13) + 1, random.nextInt(4))
          ..position = Vector2(100 + i * 1150, 100 + j * 1500)
          ..addToParent(world);
        if (random.nextDouble() < 0.9) {
          // flip face up with 90% probability
          card.flip();
        }
      }
    }

    final cards = [
      for (var rank = 1; rank <= 13; rank++)
        for (var suit = 0; suit < 4; suit++) Card(rank, suit)
    ];
    world.addAll(cards);
    cards.forEach(stock.acquireCard);
  }
}
