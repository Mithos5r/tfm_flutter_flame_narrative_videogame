part of 'episodes.dart';

ArrugasChapterRouter _initializeEpisode5() =>  ArrugasChapterRouter(
      nextEpisode: 5,
      imagePath: Assets.images.episodes.episode5.episode5View1.path,
      maximumImageAvailables: 18,
      onChapterEnd: continueDialog,
    );
