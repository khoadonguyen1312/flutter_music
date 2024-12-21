import 'package:fluttermusic/model/SongModel.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YtExplore {
  final YoutubeExplode youtubeExplode = YoutubeExplode();

  Future<Song> fetchData(String id) async {
    Song data = Song(
        id: id,
        title: "title",
        describe: "describe",
        duration: Duration.zero,
        updateAt: DateTime.now(),
        audioLink: "",
        favorite: false,
        channel_id: "");

    try {
      Video video = await youtubeExplode.videos.get(id).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          throw Exception("Request timed out");
        },
      );
      if (video != null) {
        data
          ..title = video.title
          ..describe = video.description
          ..duration = video.duration ?? Duration.zero
          ..updateAt = video.uploadDate ?? DateTime.now()
          ..channel_id = video.channelId.toString();
      }
    } catch (e) {
      print("Error fetching video data: $e");
    }

    return data;
  }
}

void main() async {
  var data = await YtExplore().fetchData("aXwnapSrlIo");
  print(data.toString());
}
