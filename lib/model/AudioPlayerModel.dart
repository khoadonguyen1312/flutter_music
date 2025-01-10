import 'package:fluttermusic/model/SongModel.dart';

class Audioplayermodel {
  List<Song> playlist = [];
  int index = 0;

  bool isLastSong() {
    return index == playlist.length - 1;
  }

  void clear() {
    playlist.clear();
  }

  Song get nowSong {
    if (playlist.isNotEmpty) {
      return playlist[index];
    }
    return Song(
      slugs: [],
        id: "",
        title: "",
        describe: "",
        duration: Duration.zero,
        updateAt: DateTime.now(),
        audioLink: "",
        favorite: false,
        img: "",
        channel_id: "");
  }

  void addSong(Song song) {
    playlist.add(song);
  }
  void seekToSong(int i) {

    if (index < 0 || index >= playlist.length) {

      return;
    }
  index =i;

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

  Future<void> dAllsong() async{
    playlist.clear();
    index=0;
  }
}
