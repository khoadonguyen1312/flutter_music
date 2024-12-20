class Song {
  const Song(
      {required this.id,
      required this.title,
      required this.describe,
      required this.duration,
      required this.update_at,
      required this.audio_link,
      required this.favorite});
  final String id, title, describe, audio_link;
  final DateTime update_at;
  final bool favorite;
  final Duration duration;
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] as String,
      title: json['title'] as String,
      describe: json['describe'] as String,
      duration: Duration(seconds: json['duration'] as int),
      update_at: DateTime(json["update_at"]),
      audio_link: json['audio_link'] as String,
      favorite: json['favorite'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "describe": describe,
      "duration": duration,
      "audio_link": audio_link,
      "favorite": favorite
    };
  }
}
