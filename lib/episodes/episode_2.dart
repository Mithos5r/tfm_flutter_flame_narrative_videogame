part of 'episodes.dart';

ArrugasChapterRouter _initializeEpisode2() => ArrugasChapterRouter(
      nextEpisode: 2,
      imagePath: Assets.images.episodes.episode2.episode2View1.path,
      maximumImageAvailables: 35,
      onChapterEnd: continueDialog,
      musicChangeSteps: {
        8: () => Future.value(BackgroundMusic.animate),
      },
    );
