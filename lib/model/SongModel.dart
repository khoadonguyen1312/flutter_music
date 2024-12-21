import 'dart:convert';

class Song {
  Song(
      {required this.id,
      required this.title,
      required this.describe,
      required this.duration,
      required this.updateAt,
      required this.audioLink,
      required this.favorite,
      required this.channel_id});

  late String id;
  late String title;
  late String describe;
  late String audioLink;
  late DateTime updateAt;
  late bool favorite;
  late Duration duration;
  late String channel_id;

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
        id: json['id'] as String,
        title: json['title'] as String,
        describe: json['describe'] as String,
        duration: Duration(seconds: json['duration'] as int),
        updateAt: DateTime.parse(json["update_at"]),
        audioLink: json['audio_link'] as String,
        favorite: json['favorite'] as bool,
        channel_id: json["channel_id"] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "describe": describe,
      "duration": duration.inSeconds,
      "update_at": updateAt.toIso8601String(),
      "audio_link": audioLink,
      "favorite": favorite,
      "channel_id": channel_id
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}
