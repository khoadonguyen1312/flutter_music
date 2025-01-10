import 'package:fluttermusic/model/SongModel.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YtExplore {
  final YoutubeExplode youtubeExplode = YoutubeExplode();
  Future<String> gAudio(String id) async {
    String data = '';
    try {
      var manifest = await youtubeExplode.videos.streams.getManifest(id);
      data = manifest.audioOnly.withHighestBitrate().url.toString();
      return data;
    } catch (e) {
      return data;
    }
  }

  Future<List<Song>> search(String query) async {
    List<Song> data = [];
    try {
      var item = await youtubeExplode.search.search(query);
      if (item.isNotEmpty) {
        for (var i in item) {
          data.add(Song(
            slugs: i.keywords,
              img: i.thumbnails.highResUrl,
              id: i.id.toString(),
              title: i.title,
              describe: i.description,
              duration: i.duration!,
              updateAt: i.uploadDate!,
              audioLink: "",
              favorite: false,
              channel_id: i.channelId.toString()));
        }
      }
      return data;
    } catch (e) {
      return data;
    }
  }

  Future<List<Song>> recomands(String id) async {
    List<Song> data = [];
    try {
      Video video = await youtubeExplode.videos.get(id);
      var items = await youtubeExplode.videos.getRelatedVideos(video);
      if (items != null) {
        for (var i in items) {
          data.add(Song(
            slugs: i.keywords,
              id: i.id.toString(),
              title: i.title,
              describe: i.description,
              duration: i.duration!,
              updateAt: i.publishDate!,
              audioLink: "",
              favorite: false,
              img: i.thumbnails.highResUrl,
              channel_id: i.channelId.toString()));
        }
      }
      return data;
    } catch (e) {
      return data;
    }
  }

  Future<Song> fetchData(String id) async {
    Song data = Song(
      slugs: [],
        img: "",
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
      data
        ..img = video.thumbnails.highResUrl
        ..title = video.title
        ..describe = video.description
        ..duration = video.duration ?? Duration.zero
        ..updateAt = video.uploadDate ?? DateTime.now()
        ..channel_id = video.channelId.toString();
    } catch (e) {
      print("Error fetching video data: $e");
    }

    return data;
  }
}

// void main() async {
//   var data = await YtExplore().fetchData("aXwnapSrlIo");
//   print(data.toString());
// }
