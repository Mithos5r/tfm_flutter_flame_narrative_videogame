import '../../common/arrugas_sounds.dart';
import '../../common/background_music.dart';
import '../../common/sfx_music.dart';
import 'actions.dart';
import 'package:flutter/material.dart';

class SettingAction extends StatelessWidget {
  const SettingAction({required this.backgroundMusic, super.key});

  final BackgroundMusic backgroundMusic;

  @override
  Widget build(BuildContext context) {
    return ArrugasAction.fromIcon(
      type: SfxButtons.menu,
      onTap: () {
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
                        'Ajustes',
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ArrugasAction.fromIcon(
                          type: SfxButtons.click,
                          onTap: () =>
                              Navigator.of(context).pushNamedAndRemoveUntil(
                            'Main',
                            (route) => false,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          icon: Icons.home,
                        ),
                        ArrugasAction(
                          type: SfxButtons.click,
                          onTap: () {
                            if (!arrugasSounds.isBackGroundPlaying) {
                              return arrugasSounds.playInBackground(
                                backgroundMusic: backgroundMusic,
                                replay: true,
                              );
                            }
                            arrugasSounds.stopResetBackground();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: StreamBuilder(
                                  stream: arrugasSounds.backgroundPlayingStream,
                                  builder: (context, isPlaying) {
                                    return Icon(
                                      isPlaying.data ?? false
                                          ? Icons.volume_up
                                          : Icons.volume_off,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        ArrugasAction.fromIcon(
                          type: SfxButtons.click,
                          onTap: () => Navigator.of(context).pop(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          icon: Icons.exit_to_app,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      icon: Icons.settings,
    );
  }
}
