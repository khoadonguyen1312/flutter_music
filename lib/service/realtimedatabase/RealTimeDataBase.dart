import 'package:flutter/cupertino.dart';
import 'package:fluttermusic/model/SongModel.dart';

abstract class RealTimeDataBase extends ChangeNotifier{
  static final String history ="history";
  static final String fav ="favorite";
  static final String recomands ="recomands";
  Future<void> pushHistory(Song song);
  Future<dynamic> gAllHistory();
}

