import '../gen/assets.gen.dart';
import 'extensions/audio_path.dart';

enum SfxButtons {
  click(volume: 0.1),
  menu(volume: 0.03),
  open(volume: 0.5),
  noMusic(volume: 0);

  const SfxButtons({
    required this.volume,
  });
  final double volume;

  String toAudioPath() {
    final path = switch (this) {
      SfxButtons.click => Assets.audio.music.settingClick,
      SfxButtons.menu => Assets.audio.music.buttonClick,
      SfxButtons.open => Assets.audio.music.settingClick,
      SfxButtons.noMusic => '',
    };
    return path.audioPath;
  }
}
