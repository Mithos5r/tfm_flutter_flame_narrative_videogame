import 'dart:developer';

import 'package:flame_audio/flame_audio.dart';
import 'package:rxdart/subjects.dart';

final ArrugasSounds arrugasSounds = ArrugasSounds();

final class ArrugasSounds {
  factory ArrugasSounds() {
    return _singleton;
  }

  ArrugasSounds._internal();
  static final ArrugasSounds _singleton = ArrugasSounds._internal();

  bool isAudioActive = true;

  bool get isBackGroundPlaying => FlameAudio.bgm.isPlaying;

  final BehaviorSubject<bool> _behaviourSubject = BehaviorSubject<bool>();

  Stream<bool> get backgroundPlayingStream =>
      _behaviourSubject.stream.asBroadcastStream();

  void playMainBackground() async {
    try {
      if (isBackGroundPlaying) {
        return await FlameAudio.bgm.stop();
      }
      FlameAudio.bgm.initialize();
      await FlameAudio.bgm.play('music/intro.mp3', volume: 0.5);
    } catch (e) {
      log("Error playing auido player");
    } finally {
      _behaviourSubject.add(FlameAudio.bgm.isPlaying);
    }
  }
}
