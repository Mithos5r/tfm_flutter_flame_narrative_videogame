import '../gen/assets.gen.dart';
import 'extensions/audio_path.dart';

enum BackgroundMusic {
  mainTheme(volume: 0.01),
  animate(volume: 0.01),
  christmas(volume: 0.01),
  defaultEpisode(volume: 0.01);

  const BackgroundMusic({
    required this.volume,
  });
  final double volume;

  String toMusicPath() {
    final path = switch (this) {
      BackgroundMusic.mainTheme => Assets.audio.music.pianoMoment,
      BackgroundMusic.animate => Assets.audio.music.lazyAfternoon,
      BackgroundMusic.christmas => Assets.audio.music.christmasStars,
      BackgroundMusic.defaultEpisode => Assets.audio.music.relaxedWalk113607,
    };

    return path.audioPath;
  }
}
