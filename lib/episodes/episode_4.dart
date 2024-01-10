part of 'episodes.dart';

ArrugasChapterRouter _initializeEpisode4() => ArrugasChapterRouter(
      nextEpisode: 4,
      imagePath: Assets.images.episodes.episode4.episode4View1.path,
      maximumImageAvailables: 24,
      onChapterEnd: continueDialog,
      backgroundMusic: BackgroundMusic.animate,
    );
