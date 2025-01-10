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
    try {
      await audioPlayer.stop();
      audioplayermodel.nextSong();
      await update_audio();
      await play_audio(audioplayermodel.nowSong.audioLink);
    } catch (e) {
      print('Error in nextSong: $e');
    }
  }

  Future<void> backSong() async {
    try {
      await audioPlayer.stop();
      audioplayermodel.backSong();
      await update_audio();
      await play_audio(audioplayermodel.nowSong.audioLink);
    } catch (e) {
      print('Error in backSong: $e');
    }
  }

  Future<void> seekToSong(int index) async {
    try {
      await audioPlayer.stop();
      audioplayermodel.seekToSong(index);
      await update_audio();
      await play_audio(audioplayermodel.nowSong.audioLink);
    } catch (e) {
      print('Error in seekToSong: $e');
    }
  }

  Future<void> updateDuration() async {
    audioPlayer.positionStream.listen((value) {
      now_duration = value;
      notifyListeners();
    });
  }

  Future<void> play_audio(String audioLink) async {
    if (audioLink.isEmpty) {
      print("Audio link is empty, waiting...");
      while (audioLink.isEmpty) {
        await Future.delayed(const Duration(seconds: 1));
      }
    }

    try {
      await audioPlayer.setUrl(audioLink);
      await audioPlayer.play();
      notifyListeners();
    } catch (e) {
      print('Error in play_audio: $e');
    }
  }

  Future<void> seekto(Duration time) async {
    try {
      await audioPlayer.seek(time);
      notifyListeners();
    } catch (e) {
      print('Error in seekto: $e');
    }
  }

  Future<void> update_audio() async {
    if (audioplayermodel.nowSong.audioLink.isEmpty) {
      try {
        audioplayermodel.nowSong.audioLink = await ytExplore.gAudio(audioplayermodel.nowSong.id);
      } catch (e) {
        print('Error in update_audio: $e');
      }
    }
  }

  Future<void> startAudio(Song song, BuildContext context) async {
    try {
      await stop();
      bottomui = true;
      await audioplayermodel.dAllsong();
      audioplayermodel.addSong(song);

      await update_audio();
      await play_audio(audioplayermodel.nowSong.audioLink);
      pushRecomandSong();

      print(song.toString());
      notifyListeners();
    } catch (e) {
      print('Error in startAudio: $e');
    }
  }

  Future<void> stop() async {
    try {
      audioplayermodel.clear();
      bottomui = false;
      await audioPlayer.stop();
      notifyListeners();
    } catch (e) {
      print('Error in stop: $e');
    }
  }

  Future<void> pause() async {
    try {
      if (audioPlayer.playing) {
        await audioPlayer.stop();
      } else {
        playing = true;
        await audioPlayer.play();
      }
      notifyListeners();
    } catch (e) {
      print('Error in pause: $e');
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
    } catch (e) {
      print('Error in pushRecomandSong: $e');
    }
  }

  bool check_is_playing(String id) {
    return id == audioplayermodel.nowSong.id;
  }

  Future<void> autoNext() async {
    audioPlayer.playerStateStream.listen((state) async {
      try {
        if (state.playing && state.processingState == ProcessingState.completed) {
          await nextSong(); // Call next song after completion
        }
      } catch (e) {
        print('Error in autoNext: $e');
      }
    });
  }
}
