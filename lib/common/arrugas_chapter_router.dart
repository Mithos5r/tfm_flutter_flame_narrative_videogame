import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../hub/widgets/actions.dart';

final class ArrugasChapterRouter {
  const ArrugasChapterRouter({
    required this.imagePath,
    required this.nextEpisode,
    required this.maximumImageAvailables,
    required this.onChapterEnd,
    this.stepGameTransition,
  });

  final int nextEpisode;
  final String imagePath;
  final int maximumImageAvailables;
  final Function(BuildContext context, int nextEpisode) onChapterEnd;
  final Map<int, Future<void> Function(BuildContext context)>?
      stepGameTransition;
}

final List<ArrugasChapterRouter> arrugasRouter = () {
  void continueDialog(BuildContext context, int nextEpisode) => showDialog(
        context: context,
        builder: (context) => Align(
          alignment: Alignment.center,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      '¿Quieres continuar?',
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ArrugasAction(
                        onTap: () => Navigator.of(context)
                            .pushNamedAndRemoveUntil('Main', (route) => false),
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey.shade200,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text('Salir'),
                            ),
                          ),
                        ),
                      ),
                      ArrugasAction(
                        onTap: () => Navigator.of(context).pushReplacementNamed(
                          'episode',
                          arguments: arrugasRouter[nextEpisode],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey.shade200,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text('Siguiente Episodio'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  return [
    ArrugasChapterRouter(
      nextEpisode: 1,
      imagePath: Assets.images.episodes.episode1.episode1View1.path,
      maximumImageAvailables: 8,
      onChapterEnd: continueDialog,
      stepGameTransition: <int, Future<void> Function(BuildContext context)>{
        3: (BuildContext context) async {
          await Navigator.of(context).pushNamed('quiz1');
        },
      },
    ),
    ArrugasChapterRouter(
      nextEpisode: 2,
      imagePath: Assets.images.episodes.episode2.episode2View1.path,
      maximumImageAvailables: 35,
      onChapterEnd: continueDialog,
    ),
    ArrugasChapterRouter(
      nextEpisode: 3,
      imagePath: Assets.images.episodes.episode3.episode3View1.path,
      maximumImageAvailables: 13,
      onChapterEnd: continueDialog,
    ),
    ArrugasChapterRouter(
      nextEpisode: 4,
      imagePath: Assets.images.episodes.episode4.episode4View1.path,
      maximumImageAvailables: 24,
      onChapterEnd: continueDialog,
    ),
    ArrugasChapterRouter(
      nextEpisode: 5,
      imagePath: Assets.images.episodes.episode5.episode5View1.path,
      maximumImageAvailables: 18,
      onChapterEnd: continueDialog,
    ),
    ArrugasChapterRouter(
      nextEpisode: 6,
      imagePath: Assets.images.episodes.episode6.episode6View1.path,
      maximumImageAvailables: 23,
      onChapterEnd: continueDialog,
    ),
    ArrugasChapterRouter(
      nextEpisode: 7,
      imagePath: Assets.images.episodes.episode7.episode7View1.path,
      maximumImageAvailables: 6,
      onChapterEnd: continueDialog,
    ),
    ArrugasChapterRouter(
      nextEpisode: 8,
      imagePath: Assets.images.episodes.episode8.episode8View1.path,
      maximumImageAvailables: 25,
      onChapterEnd: continueDialog,
    ),
    ArrugasChapterRouter(
      nextEpisode: 9,
      imagePath: Assets.images.episodes.episode9.episode9View1.path,
      maximumImageAvailables: 40,
      onChapterEnd: continueDialog,
    ),
    ArrugasChapterRouter(
      nextEpisode: 10,
      imagePath: Assets.images.episodes.episode10.episode10View1.path,
      maximumImageAvailables: 48,
      onChapterEnd: continueDialog,
    ),
    ArrugasChapterRouter(
      nextEpisode: 11,
      imagePath: Assets.images.episodes.episode11.episode11View1.path,
      maximumImageAvailables: 16,
      onChapterEnd: continueDialog,
    ),
    ArrugasChapterRouter(
      nextEpisode: 12,
      imagePath: Assets.images.episodes.episode12.episode12View1.path,
      maximumImageAvailables: 20,
      onChapterEnd: continueDialog,
    ),
    ArrugasChapterRouter(
      nextEpisode: 13,
      imagePath: Assets.images.episodes.episode13.episode13View1.path,
      maximumImageAvailables: 4,
      onChapterEnd: continueDialog,
    ),
    ArrugasChapterRouter(
      nextEpisode: 14,
      imagePath: Assets.images.episodes.episode14.episode14View1.path,
      maximumImageAvailables: 3,
      onChapterEnd: continueDialog,
    ),
  ];
}.call();
