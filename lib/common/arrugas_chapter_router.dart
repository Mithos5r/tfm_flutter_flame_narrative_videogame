import 'dart:async';

import 'package:flutter/material.dart';

import 'background_music.dart';
export 'background_music.dart';

final class ArrugasChapterRouter {
  const ArrugasChapterRouter({
    required this.imagePath,
    required this.nextEpisode,
    required this.maximumImageAvailables,
    required this.onChapterEnd,
    this.stepGameTransition = const {},
    this.musicChangeSteps = const {},
    this.backgroundMusic = BackgroundMusic.defaultEpisode,
  });

  final int nextEpisode;
  final String imagePath;
  final BackgroundMusic backgroundMusic;
  final int maximumImageAvailables;
  final Function(BuildContext context, int nextEpisode) onChapterEnd;
  final Map<int, Future<void> Function(BuildContext context)>
      stepGameTransition;

  final Map<int, Future<BackgroundMusic?> Function()> musicChangeSteps;
}
