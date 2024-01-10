import '../gen/assets.gen.dart';
import 'extensions/audio_path.dart';

enum SfxButtons {
  click(volume: 0.03),
  menu(volume: 0.03),
  open(volume: 0.3),
  noMusic(volume: 0);

  const SfxButtons({
    required this.volume,
  });
  final double volume;

  String toAudioPath() {
    final path = switch (this) {
      SfxButtons.click => Assets.audio.music.menuOpen,
      SfxButtons.menu => Assets.audio.music.buttonClick,
      SfxButtons.open => Assets.audio.music.menuOpen,
      SfxButtons.noMusic => '',
    };
    return path.audioPath;
  }
}
