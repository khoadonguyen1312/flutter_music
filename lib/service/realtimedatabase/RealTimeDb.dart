// import 'package:firebase_database/firebase_database.dart';
// import 'package:fluttermusic/model/SongModel.dart';

// class RealTimeDatabaseConfig {
//   // static DatabaseReference rootReference = FirebaseDatabase.instance.ref();

//   static const String searchHistoryNode = "search_history";
//   static const String favoriteNode = "favorite";
//   static const String historyNode = "history";
// }

// abstract class Realtimedb {
//   void psearch(String search);
//   List<String> gsearch();
//   void phistory(Song song);
//   List<dynamic> history();
//   void favorite(Song id);
//   Future allFavorite();
//   bool isfavorite(String id);
// }

// class RealTimeDbImp extends Realtimedb {
//   DatabaseReference reference = FirebaseDatabase.instance.ref();
//   @override
//   Future<List> allFavorite() async {
//     List<String> data = [];
//     try {
//       var snapshot =
//           await reference.child(RealTimeDatabaseConfig.favoriteNode).get();
//       if (snapshot.exists) {
//         for (var i in data) {
//           data.add(i);
//         }
//       }
//       return data;
//     } catch (e) {
//       return data;
//     }
//   }

//   @override
//   Future<void> favorite(Song id) async {}

//   @override
//   List<String> gsearch() {
//     // TODO: implement gsearch
//     throw UnimplementedError();
//   }

//   @override
//   List history() {
//     // TODO: implement history
//     throw UnimplementedError();
//   }

//   @override
//   bool isfavorite(String id) {
//     // TODO: implement isfavorite
//     throw UnimplementedError();
//   }

//   @override
//   void phistory(Song song) {
//     // TODO: implement phistory
//   }

//   @override
//   void psearch(String search) {
//     // TODO: implement psearch
//   }
// }
