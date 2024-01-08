import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'common/arrugas_sounds.dart';
import 'gen/assets.gen.dart';

import 'hub/episodes/episode1_quiz.dart';
import 'hub/generic_episode.dart';
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
    MaterialApp(
      initialRoute: 'Main',
      routes: {
        'Main': (context) => const MainScreen(),
        'episode': (context) => const GenericEpisode(),
        'quiz1': (context) => const Episode1Quiz(),
        // 'episode2': (context) => const GenericEpisode(),
        // 'episode3': (context) => const GenericEpisode(),
        // 'episode4': (context) => const GenericEpisode(),
        // 'episode5': (context) => const GenericEpisode(),
        // 'episode6': (context) => const GenericEpisode(),
        // 'episode7': (context) => const GenericEpisode(),
        // 'episode8': (context) => const GenericEpisode(),
        // 'episode9': (context) => const GenericEpisode(),
        // 'episode10': (context) => const GenericEpisode(),
        // 'episode11': (context) => const GenericEpisode(),
        // 'episode12': (context) => const GenericEpisode(),
        // 'episode13': (context) => const GenericEpisode(),
      },
    ),
  );
}

class Arrugas extends FlameGame {
  late final RouterComponent router;
  @override
  Future<void> onLoad() async {
    // add(
    //   router = RouterComponent(
    //     routes: {
    //       'Main': MainScreen(game: game),
    //       'episode1': MainScreen(game: game),
    //       'episode2': MainScreen(game: game),
    //       'episode3': MainScreen(game: game),
    //       'episode4': MainScreen(game: game),
    //       'episode5': MainScreen(game: game),
    //       'episode6': MainScreen(game: game),
    //       'episode7': MainScreen(game: game),
    //       'episode8': MainScreen(game: game),
    //       'episode9': MainScreen(game: game),
    //       'episode10': MainScreen(game: game),
    //       'episode11': MainScreen(game: game),
    //       'episode12': MainScreen(game: game),
    //       'episode13': MainScreen(game: game),
    //     },
    //     initialRoute: 'home',
    //   ),
    // );
  }
}

final class EpisodesTraces {}
