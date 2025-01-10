import 'package:flutter/cupertino.dart';
import 'package:fluttermusic/model/SongModel.dart';
import 'package:fluttermusic/service/auth/FirebaseAuth.dart';
import 'package:provider/provider.dart';

abstract class RealTimeDataBase extends ChangeNotifier{

  static final String history ="history";
  static final String fav ="favorite";
  static final String recomands ="recomands";
  Future<void> pushHistory(Song song,String userid);
  Future<dynamic> gAllHistory(String userid);
}

