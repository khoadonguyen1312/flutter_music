import 'package:flutter/material.dart';
import 'package:fluttermusic/service/realtimedatabase/RealTimeDb.dart';

class Searchdb extends ChangeNotifier {
  final RealTimeDatabase _realTimeDatabase;
  List<String> items = [];
  Searchdb(this._realTimeDatabase);
  final String node = RealTimeDatabase.searchHistoryNode;

  Future<void> push(String query) async {
    try {
      await _realTimeDatabase.rootReference.child(node).push().set(query);

      notifyListeners();
    } catch (E) {}
  }

  Future<void> getAll() async {
    try {
      final snapshot = await _realTimeDatabase.rootReference.child(node).get();

      if (snapshot.exists && snapshot.value != null) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        items = data.values.map((i) => i.toString()).toList();
      } else {
        items = []; // Trả về danh sách rỗng nếu node không có dữ liệu
      }
      notifyListeners(); // Cập nhật UI
    } catch (e) {
      print('Error fetching data: $e');
      items = [];
      notifyListeners();
    }
  }
}

void main() async {
  await Searchdb(RealTimeDatabase()).push("nơi này có anh");
}
