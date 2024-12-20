import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SearchHistory extends ChangeNotifier {
  final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  List<String> history = [];

  Future<void> add(String query) async {
    try {
      await firebaseDatabase.ref("search_history").push().set(query);
      print("Thêm slug thành công");
      notifyListeners();
    } catch (e) {
      print("Lỗi khi thêm lịch sử tìm kiếm vào DB: $e");
    }
  }

  Future<void> getAllHistory() async {
    try {
      final snapshot = await firebaseDatabase.ref("search_history").get();
      if (snapshot.exists && snapshot.value != null) {
        var data = snapshot.value as Map<dynamic, dynamic>;
        history = data.values.cast<String>().toList();
        notifyListeners();
      }
    } catch (e) {
      print("Lỗi khi lấy lịch sử tìm kiếm: $e");
    }
  }
}
