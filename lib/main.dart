import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';

import 'common/arrugas_sounds.dart';
import 'hub/main_screen.dart';
import 'objects/card.dart';
import 'objects/foundation.dart';

import 'objects/stock.dart';
import 'objects/tableau_pile.dart';
import 'objects/waste.dart';
import 'utils/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import 'package:flame/game.dart';
import 'package:flutter/widgets.dart' show runApp;

void main() {
  runApp(
    GameWidget(
      game: Arrugas(),
      overlayBuilderMap: {'Main': (_, game) => const MainScreen()},
      initialActiveOverlays: const ['Main'],
    ),
  );
}

class Arrugas extends FlameGame {
  @override
  Future<void> onLoad() async {}
}
