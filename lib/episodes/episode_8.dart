part of 'episodes.dart';

ArrugasChapterRouter _initializeEpisode8() => ArrugasChapterRouter(
      nextEpisode: 8,
      imagePath: Assets.images.episodes.episode8.episode8View1.path,
      maximumImageAvailables: 25,
      onChapterEnd: continueDialog,
      backgroundMusic: BackgroundMusic.christmas,
    );
