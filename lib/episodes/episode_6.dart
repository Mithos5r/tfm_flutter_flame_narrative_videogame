part of 'episodes.dart';

ArrugasChapterRouter _initializeEpisode6() => ArrugasChapterRouter(
      nextEpisode: 6,
      imagePath: Assets.images.episodes.episode6.episode6View1.path,
      maximumImageAvailables: 23,
      onChapterEnd: continueDialog,
      backgroundMusic: BackgroundMusic.animate,
    );
