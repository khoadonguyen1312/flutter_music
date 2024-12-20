import 'package:fluttermusic/model/SongModel.dart';

class Audioplayermodel {
  List<Song> playlist = [];
  int index = 0;

  bool isLastSong() {
    return index == playlist.length - 1;
  }

  Song get nowSong {
    if (playlist.isEmpty) {
      throw Exception("Playlist is empty");
    }
    return playlist[index];
  }

  void addSong(Song song) {
    playlist.add(song);
  }

  void deleteSong(int index) {
    if (index >= 0 && index < playlist.length) {
      playlist.removeAt(index);
    }
  }

  void nextSong() {
    if (index < playlist.length - 1) {
      index++;
    }
  }

  void backSong() {
    if (index > 0) {
      index--;
    }
  }
}