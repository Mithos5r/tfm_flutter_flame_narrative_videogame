import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/arrugas_chapter_router.dart';

import '../gen/assets.gen.dart';
import 'widgets/actions.dart';
import 'widgets/settings_action.dart';

class GenericEpisode extends StatefulWidget {
  const GenericEpisode({super.key});

  @override
  State<GenericEpisode> createState() => _GenericEpisodeState();
}

class _GenericEpisodeState extends State<GenericEpisode> {
  int counter = 1;
  String imageCurrentPath = Assets.images.episodes.episode1.episode1View1.path;
  int maximumNumberOfSlices = 0;
  ArrugasChapterRouter? viewArguments;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    viewArguments =
        ModalRoute.of(context)?.settings.arguments as ArrugasChapterRouter?;

    imageCurrentPath = viewArguments?.imagePath ?? imageCurrentPath;
    maximumNumberOfSlices =
        viewArguments?.maximumImageAvailables ?? maximumNumberOfSlices;

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
              child: Image.asset(imageCurrentPath, fit: BoxFit.fitHeight),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: SettingAction(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ArrugasAction.fromIcon(
                onTap: () async {
                  final step = viewArguments?.stepGameTransition?[counter];
                  if (step != null) {
                    await step.call(context);
                  }

                  counter++;
                  if (counter > maximumNumberOfSlices) {
                    // ignore: use_build_context_synchronously
                    viewArguments?.onChapterEnd
                        .call(context, (viewArguments?.nextEpisode ?? 0));
                    return;
                  }

                  final regex = RegExp(r'view\d*\.png');
                  final fileWithoutFormat =
                      imageCurrentPath.replaceAll(regex, '');

                  imageCurrentPath = "${fileWithoutFormat}view$counter.png";
                  setState(() {});
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                icon: Icons.arrow_forward_ios_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
