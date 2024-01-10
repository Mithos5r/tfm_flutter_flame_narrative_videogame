library episodes;

import 'package:flutter/material.dart';

import '../common/arrugas_chapter_router.dart';

import '../common/sfx_music.dart';
import '../gen/assets.gen.dart';
import '../hub/widgets/actions.dart';

part 'episode_1.dart';
part 'episode_2.dart';
part 'episode_3.dart';
part 'episode_4.dart';
part 'episode_5.dart';
part 'episode_6.dart';
part 'episode_7.dart';
part 'episode_8.dart';
part 'episode_9.dart';
part 'episode_10.dart';
part 'episode_11.dart';
part 'episode_12.dart';
part 'episode_13.dart';
part 'episode_14.dart';

final List<ArrugasChapterRouter> episodesList = [
  _initializeEpisode1(),
  _initializeEpisode2(),
  _initializeEpisode3(),
  _initializeEpisode4(),
  _initializeEpisode5(),
  _initializeEpisode6(),
  _initializeEpisode7(),
  _initializeEpisode8(),
  _initializeEpisode9(),
  _initializeEpisode10(),
  _initializeEpisode11(),
  _initializeEpisode12(),
  _initializeEpisode13(),
  _initializeEpisode14(),
];

Future<void> continueDialog(
  BuildContext context,
  int nextEpisode,
) =>
    showDialog(
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
                      type: SfxButtons.open,
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
                      type: SfxButtons.open,
                      onTap: () => Navigator.of(context).pushReplacementNamed(
                        'episode',
                        arguments: episodesList[nextEpisode],
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
