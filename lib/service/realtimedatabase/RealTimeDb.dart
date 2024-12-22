import 'package:firebase_database/firebase_database.dart';

class RealTimeDatabase {
  final DatabaseReference rootReference = FirebaseDatabase.instance.ref();

  static const String searchHistoryNode = "search_history";
  static const String favoriteNode = "favorite";
  static const String historyNode = "history";
}
