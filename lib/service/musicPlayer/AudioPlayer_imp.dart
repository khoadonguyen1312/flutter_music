import 'package:flutter/material.dart';
import 'package:fluttermusic/model/AudioPlayerModel.dart';
import 'package:fluttermusic/model/SongModel.dart';
import 'package:fluttermusic/service/yotutube/AppYtExplore.dart';
import 'package:just_audio/just_audio.dart';

class AudioplayerImp extends ChangeNotifier {
  bool playing = false;
  bool bottomui = false;
  Duration now_duration = Duration.zero;
  final AudioPlayer audioPlayer = AudioPlayer();
  final Audioplayermodel audioplayermodel = Audioplayermodel();
  final YtExplore ytExplore = YtExplore();
  AudioplayerImp() {
    updateDuration();
    autoNext();
  }
  Future<void> nextSong() async {
   await audioPlayer.stop();
    audioplayermodel.nextSong();
    await update_audio();
    play_audio(audioplayermodel.nowSong.audioLink);

  }
  Future<void> backSong()async{
      await audioPlayer.stop();
      audioplayermodel.backSong();
      await update_audio();
      play_audio(audioplayermodel.nowSong.audioLink);

  }
  Future<void> seekToSong(int index)async{
      await audioPlayer.stop();
      audioplayermodel.seekToSong(index);
      await update_audio();
      play_audio(audioplayermodel.nowSong.audioLink);


  }
  Future<void> updateDuration() async {
    audioPlayer.positionStream.listen((value) {
      now_duration = value;
      notifyListeners();
    });
  }

  Future<void> play_audio(String audioLink) async {
    while (audioLink == '') {
      print("audio đang null đợi tí...");
      await Future.delayed(const Duration(seconds: 1));
    }

    await audioPlayer.setUrl(audioLink);
    await audioPlayer.play();

    notifyListeners();
  }

  Future<void> seekto(Duration time) async {
    await audioPlayer.seek(time);
    notifyListeners();
  }

  Future<void> update_audio() async {
    if (audioplayermodel.nowSong.audioLink.isEmpty) {
      audioplayermodel.nowSong.audioLink =
          await ytExplore.gAudio(audioplayermodel.nowSong.id);
    }
  }

  Future<void> startAudio(Song song, BuildContext context) async {
  await stop();
    bottomui = true;
   await audioplayermodel.dAllsong();
    audioplayermodel.addSong(song);

    await update_audio();
    play_audio(audioplayermodel.nowSong.audioLink);
    pushRecomandSong();
  print(song.toString());
    notifyListeners();
  }

  Future<void> stop() async {
    Audioplayermodel().clear();
    bottomui = false;
    await audioPlayer.stop();
    notifyListeners();
  }

  Future<void> pause() async {
    if (audioPlayer.playing) {
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
  Future<void> autoNext() async {
    audioPlayer.playerStateStream.listen((state) {
      if (state.playing) {
        if (state.processingState == ProcessingState.completed) {
          nextSong(); // Call the function to play the next song
        }
      }
    });
  }


}
