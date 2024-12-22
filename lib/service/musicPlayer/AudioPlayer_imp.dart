import 'package:flutter/material.dart';
import 'package:fluttermusic/model/AudioPlayerModel.dart';
import 'package:fluttermusic/model/SongModel.dart';
import 'package:fluttermusic/service/yotutube/AppYtExplore.dart';
import 'package:just_audio/just_audio.dart';

class AudioplayerImp extends ChangeNotifier {
  bool playing = false;
  bool bottomui = false;
  final AudioPlayer audioPlayer = AudioPlayer();
  final Audioplayermodel audioplayermodel = Audioplayermodel();
  final YtExplore ytExplore = YtExplore();

  Future<void> nextSong() async {
    audioplayermodel.nextSong();
    update_audio();
    play_audio(audioplayermodel.nowSong.audioLink);
  }

  Future<void> play_audio(String audioLink) async {
    while (audioLink == null) {
      print("audio đang null đợi tí...");
      await Future.delayed(const Duration(seconds: 1));
    }

    await audioPlayer.setUrl(audioLink);
    await audioPlayer.play();
    bottomui = true;
    playing = true;
    notifyListeners();
  }

  Future<void> update_audio() async {
    if (audioplayermodel.nowSong.audioLink == "") {
      audioplayermodel.nowSong
        ..audioLink = await YtExplore().gAudio(audioplayermodel.nowSong.id);
    }
  }

  Future<void> startAudio(Song song) async {
    audioplayermodel.dAllsong();
    audioplayermodel.addSong(song);

    await update_audio();
    play_audio(audioplayermodel.nowSong.audioLink);
    pushRecomandSong();
    notifyListeners();
  }

  Future<void> stop() async {
    bottomui = false;
    await audioPlayer.stop();
    notifyListeners();
  }

  Future<void> pause() async {
    if (audioPlayer.playing) {
      playing = false;
      await audioPlayer.stop();
      notifyListeners();
    } else {
      playing = true;
      await audioPlayer.play();
      notifyListeners();
    }
  }

  Future<void> pushRecomandSong() async {
    try {
      List<Song> items = await ytExplore.recomands(audioplayermodel.nowSong.id);
      for (var i in items) {
        bool exists = audioplayermodel.playlist.any((song) => song.id == i.id);
        if (!exists) {
          audioplayermodel.addSong(i);
        }
      }
    } catch (e) {}
  }

  bool check_is_playing(String id) {
    return id == audioplayermodel.nowSong.id;
  }
}
