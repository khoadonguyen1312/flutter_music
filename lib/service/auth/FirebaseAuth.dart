import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttermusic/screens/SignInScreen.dart';
import 'package:fluttermusic/ultil.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthMethod extends ChangeNotifier {
  final FirebaseAuth _auth;
  bool auth = false;
  FireBaseAuthMethod(this._auth, BuildContext context) {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        auth = true;
      } else {
        auth = false;
      }
      notifyListeners();
    });
  }

  User? get user => _auth.currentUser;

  Stream<User?> get authState => _auth.authStateChanges();

  Future<void> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    } catch (error) {
      print('Google sign-in failed: $error');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    print('User signed out');
  }
}
