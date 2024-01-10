import 'dart:developer';
import 'dart:math' as math;

import 'package:flame_audio/flame_audio.dart';
import 'package:rxdart/subjects.dart';

import '../gen/assets.gen.dart';
import 'background_music.dart';
import 'extensions/audio_path.dart';
import 'sfx_music.dart';

final ArrugasSounds arrugasSounds = ArrugasSounds();

final class ArrugasSounds {
  factory ArrugasSounds() {
    return _singleton;
  }

  ArrugasSounds._internal();
  static final ArrugasSounds _singleton = ArrugasSounds._internal();

  final math.Random rng = math.Random();

  bool isAudioActive = true;

  bool get isBackGroundPlaying => FlameAudio.bgm.isPlaying;

  final BehaviorSubject<bool> _behaviourSubject = BehaviorSubject<bool>();

  Stream<bool> get backgroundPlayingStream =>
      _behaviourSubject.stream.asBroadcastStream();

  Future<void> stopResetBackground({bool reset = false}) async {
    await FlameAudio.bgm.stop();
    _behaviourSubject.add(FlameAudio.bgm.isPlaying);
  }

  void playInBackground({
    bool replay = false,
    BackgroundMusic backgroundMusic = BackgroundMusic.mainTheme,
  }) async {
    try {
      if (isBackGroundPlaying) {
        if (!replay) {
          return await FlameAudio.bgm.stop();
        }
      }
      FlameAudio.bgm.initialize();
      await FlameAudio.bgm
          .play(backgroundMusic.toMusicPath(), volume: backgroundMusic.volume);
      currentBackgroundMusic = '';
    } catch (e) {
      log("Error playing audio player");
    } finally {
      _behaviourSubject.add(FlameAudio.bgm.isPlaying);
    }
  }

  String currentBackgroundMusic = '';
  void playEpisodeBackground({required BackgroundMusic backgroundMusic}) async {
    try {
      final episodeMusic = backgroundMusic.toMusicPath();
      if (currentBackgroundMusic == episodeMusic) {
        return;
      }
      if (isBackGroundPlaying) {
        await FlameAudio.bgm.stop();
      }
      FlameAudio.bgm.initialize();
      await FlameAudio.bgm.play(episodeMusic, volume: backgroundMusic.volume);
      currentBackgroundMusic = episodeMusic;
    } catch (e) {
      log("Error playing audio player");
    } finally {
      _behaviourSubject.add(FlameAudio.bgm.isPlaying);
    }
  }

  void nextPage() {
    try {
      if (rng.nextInt(2) == 0) {
        FlameAudio.play(Assets.audio.music.nextPage1.audioPath, volume: 0.03);
      } else {
        FlameAudio.play(Assets.audio.music.nextPage3.audioPath, volume: 0.03);
      }
    } catch (e) {
      log("Error playing audio player");
    }
  }

  void action(SfxButtons type) {
    try {
      FlameAudio.play(type.toAudioPath(), volume: type.volume);
    } catch (e) {
      log("Error playing audio player");
    }
  }
}
