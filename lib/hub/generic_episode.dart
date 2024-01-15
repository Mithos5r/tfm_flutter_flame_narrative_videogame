import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/arrugas_chapter_router.dart';

import '../common/arrugas_sounds.dart';
import '../common/sfx_music.dart';
import '../gen/assets.gen.dart';
import 'widgets/actions.dart';
import 'widgets/image_platform_management.dart';
import 'widgets/settings_action.dart';

class GenericEpisode extends StatefulWidget {
  const GenericEpisode({super.key});

  @override
  State<GenericEpisode> createState() => _GenericEpisodeState();
}

class _GenericEpisodeState extends State<GenericEpisode> {
  int counter = 1;

  ArrugasImage arrugasImage =
      ArrugasImage(Assets.images.episodes.episode1.episode1View1.path);
  int maximumNumberOfSlices = 0;
  ArrugasChapterRouter? viewArguments;

  BackgroundMusic backgroundMusic = BackgroundMusic.mainTheme;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    viewArguments =
        ModalRoute.of(context)?.settings.arguments as ArrugasChapterRouter?;

    arrugasImage = arrugasImage.copyWith(assetName: viewArguments?.imagePath);
    maximumNumberOfSlices =
        viewArguments?.maximumImageAvailables ?? maximumNumberOfSlices;

    final arguments = viewArguments;
    if (arguments != null) {
      backgroundMusic = arguments.backgroundMusic;
      if (arrugasSounds.isBackGroundPlaying) {
        arrugasSounds.playEpisodeBackground(
          backgroundMusic: arguments.backgroundMusic,
        );
      }
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ColoredBox(
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: kIsWeb ? Alignment.center : Alignment.topCenter,
              child: arrugasImage.image(
                fit: BoxFit.fitHeight,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SettingAction(
                backgroundMusic: backgroundMusic,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white38,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "$counter/${viewArguments?.maximumImageAvailables}",
                        style: const TextStyle(
                          color: Colors.black26,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  if (kDebugMode)
                    ArrugasAction.fromIcon(
                      onTap: () {
                        counter--;
                        arrugasImage = arrugasImage.nextImage(counter: counter);
                        setState(() {});
                      },
                      icon: Icons.arrow_back_ios_new_rounded,
                      padding: const EdgeInsets.all(5),
                      type: SfxButtons.noMusic,
                    ),
                  ArrugasAction.fromIcon(
                    type: SfxButtons.noMusic,
                    onTap: () async {
                      await _stepsAndMusicChanges(context);

                      counter++;
                      if (counter > maximumNumberOfSlices) {
                        // ignore: use_build_context_synchronously
                        viewArguments?.onChapterEnd
                            .call(context, (viewArguments?.nextEpisode ?? 0));
                        return;
                      }

                      arrugasImage = arrugasImage.nextImage(counter: counter);
                      setState(() {});
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    icon: Icons.arrow_forward_ios_rounded,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _stepsAndMusicChanges(BuildContext context) async {
    final step = viewArguments?.stepGameTransition[counter];
    await step?.call(context);

    arrugasSounds.nextPage();

    final musicChangeStep = viewArguments?.musicChangeSteps[counter];
    if (musicChangeStep != null) {
      final newBackgroundMusic = await musicChangeStep.call();
      if (newBackgroundMusic != null) {
        backgroundMusic = newBackgroundMusic;
        if (arrugasSounds.isBackGroundPlaying) {
          arrugasSounds.playEpisodeBackground(
            backgroundMusic: backgroundMusic,
          );
        }
      }
    }
  }
}
