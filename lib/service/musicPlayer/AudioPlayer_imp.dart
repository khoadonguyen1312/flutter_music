import 'package:flutter/material.dart';
import 'package:fluttermusic/model/SongModel.dart';
import 'package:just_audio/just_audio.dart';

class AudioplayerImp extends ChangeNotifier {
  final AudioPlayer audioPlayer = AudioPlayer();
  Future<void> play_audio(String audio_link) async {
    while (audio_link == null) {
      print("audio đang null đợi tí...");
      await Future.delayed(Duration(seconds: 1));
    }
    await audioPlayer.setUrl(audio_link);
    await audioPlayer.play();
  }

  Future<void> startAudio(Song song) async {}
}
