import '../common/arrugas_sounds.dart';
import '../common/episodes.dart';
import '../common/layout_rules.dart';
import '../gen/assets.gen.dart';
import 'widgets/actions.dart';
import '../l10n/l10n.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget with LayoutRules {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final screenSize = MediaQuery.sizeOf(context);

    final ScreenSizeSupport size =
        obtainLayoutJumps(mediaQuery: MediaQuery.of(context));
    const double appBarMaxHeight = 200;

    final screenWidth = screenSize.width;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: Assets.images.hubs.entrance.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: ColoredBox(
        color: Colors.white.withOpacity(0.8),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: appBarMaxHeight),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 32),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
                        Assets.images.logos.personaje.image(
                          width: size.resolve<double>(
                            onSmall: () => screenWidth * 0.20,
                            onMedium: () => appBarMaxHeight * 0.6,
                            onLarge: () => appBarMaxHeight,
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                        Assets.images.logos.arrugas.image(
                          width: size.resolve<double>(
                            onSmall: () => screenWidth * 0.50,
                            onMedium: () => appBarMaxHeight * 1.2,
                            onLarge: () => appBarMaxHeight * 2,
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                        const Spacer(),
                        ArrugasAction(
                          onTap: arrugasSounds.playMainBackground,
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: StreamBuilder(
                              stream: arrugasSounds.backgroundPlayingStream,
                              builder: (context, isPlaying) {
                                return Icon(
                                  isPlaying.data ?? false
                                      ? Icons.volume_up
                                      : Icons.volume_off,
                                  size: 50,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.resolve<double>(
                      onSmall: () => 32,
                      onMedium: () => screenWidth * 0.20,
                      onLarge: () => screenWidth * 0.3,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    final String title = Episodes.localizations(
                      l10n: l10n,
                      episode: index + 1,
                    );
                    return ArrugasAction(
                      onTap: () => print(index),
                      child: ColoredBox(
                        color: Colors.white.withOpacity(0.5),
                        child: SizedBox(
                          width: 600,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 20,
                            ),
                            child: Text(
                              '${l10n.episido_word} ${index + 1}:  $title',
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: Episodes.values.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
