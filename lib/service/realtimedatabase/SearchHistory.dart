import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SearchHistory extends ChangeNotifier {
  final DatabaseReference firebaseDatabase = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL:
              "https://musicstreaming-9385f-default-rtdb.firebaseio.com/")
      .ref();

  List<String> history = [];

  Future<void> add(String query) async {
    try {
      print("đang thêm search");
      await firebaseDatabase.child("search_history").push().set(query);
      print("thêm thành công");
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllHistory() async {}
}
