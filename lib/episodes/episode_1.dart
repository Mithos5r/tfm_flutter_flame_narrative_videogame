part of 'episodes.dart';

ArrugasChapterRouter _initializeEpisode1() => ArrugasChapterRouter(
      nextEpisode: 1,
      imagePath: Assets.images.episodes.episode1.episode1View1.path,
      maximumImageAvailables: 8,
      onChapterEnd: continueDialog,
      backgroundMusic: BackgroundMusic.animate,
      stepGameTransition: <int, Future<void> Function(BuildContext context)>{
        // 3: (BuildContext context) async {
        //   await Navigator.of(context).pushNamed('quiz1');
        // },
      },
      musicChangeSteps: {
        5: () => Future.value(BackgroundMusic.defaultEpisode),
        
      },
    );
