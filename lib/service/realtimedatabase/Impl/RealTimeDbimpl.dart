import 'dart:convert';
import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:fluttermusic/service/realtimedatabase/RealTimeDataBase.dart';

import '../../../model/SongModel.dart';


class RealTimeDBImpl implements RealTimeDataBase  {
  final FirebaseDatabase firebaseDatabase =FirebaseDatabase.instance;
  @override
  Future<List<Song>> gAllHistory(String userid) async {
    try {
      // Lấy dữ liệu từ Firebase
      DataSnapshot snapshot =
      await firebaseDatabase.ref(RealTimeDataBase.history).get();

      if (snapshot.exists) {
        // Ép kiểu dữ liệu trả về thành Map
        var data = snapshot.value as Map<dynamic, dynamic>;

        // Chuyển đổi dữ liệu từ Map thành List<Song>
        List<Song> mapdata = data.values
            .map((songData) =>
            Song.fromJson(Map<String, dynamic>.from(songData)))
            .toList();

        print("Fetched ${mapdata.length} songs from history.");
        return mapdata;
      } else {
        print("No history data found.");
        return [];
      }
    } catch (e) {
      print("Error fetching history: $e");
      return [];
    }
  }




  @override
  Future<void> pushHistory(Song song,String userid) async {
  try{
  await  firebaseDatabase.ref(RealTimeDataBase.history).push().set(song.toJson());
  print("push lich su thanh cong bai hat co ten "+song.title);
  notifyListeners();
  }
catch(e){
    print(e);
}
  }

  @override
  void addListener(VoidCallback listener) {

  }

  @override
  void dispose() {

  }

  @override

  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {

  }

  @override
  void removeListener(VoidCallback listener) {

  }



}