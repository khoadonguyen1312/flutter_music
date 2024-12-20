import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttermusic/BottomTab.dart';
import 'firebaseOption.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: Firebaseoption.currentPlatform);
  runApp(BottomTab());
}
