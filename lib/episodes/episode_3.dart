part of 'episodes.dart';

ArrugasChapterRouter _initializeEpisode3() => ArrugasChapterRouter(
      nextEpisode: 3,
      imagePath: Assets.images.episodes.episode3.episode3View1.path,
      maximumImageAvailables: 13,
      onChapterEnd: continueDialog,
    );
