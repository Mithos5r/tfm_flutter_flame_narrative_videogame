import 'package:flutter/material.dart';

import 'hub/generic_episode.dart';
import 'hub/main_screen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: 'Main',
      routes: {
        'Main': (context) => const Material(
              child: MainScreen(),
            ),
        'episode': (context) => const Material(
              child: GenericEpisode(),
            ),
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
