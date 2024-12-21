import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealTimeDatabase {
  final DatabaseReference rootReference = FirebaseDatabase.instance.ref();

  static const String searchHistoryNode = "search_history";
  static const String favoriteNode = "favorite";
  static const String historyNode = "history";
}