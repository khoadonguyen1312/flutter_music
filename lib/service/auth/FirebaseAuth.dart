import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttermusic/screens/SignInScreen.dart';
import 'package:fluttermusic/ultil.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthMethod extends ChangeNotifier {
  final FirebaseAuth _auth;
  bool auth = false; // Biến auth sẽ lưu trạng thái đăng nhập

  // Constructor
  FireBaseAuthMethod(this._auth, BuildContext context) {
    // Lắng nghe sự thay đổi trạng thái của người dùng
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        auth = true; // Nếu có người dùng, gán auth thành true
      } else {
        auth =
            false; // Nếu không có người dùng (đăng xuất), gán auth thành false
        pushNewScreen(
            Signinscreen(), context); // Chuyển hướng đến màn hình đăng nhập
      }
      notifyListeners(); // Thông báo cho UI về sự thay đổi của auth
    });
  }

  // Trả về người dùng hiện tại (nếu có)
  User? get user => _auth.currentUser;

  // Lấy trạng thái xác thực của người dùng
  Stream<User?> get authState => _auth.authStateChanges();

  // Hàm đăng nhập bằng Google
  Future<void> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);

    try {
      // Yêu cầu người dùng đăng nhập với Google
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // Nếu người dùng hủy đăng nhập
        print('Google sign-in canceled');
        return;
      }

      // Lấy thông tin xác thực của người dùng từ Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Sử dụng Firebase để xác thực với token của Google
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Đăng nhập vào Firebase
      await _auth.signInWithCredential(credential);
    } catch (error) {
      print('Google sign-in failed: $error');
    }
  }

  // Hàm đăng xuất
  Future<void> signOut() async {
    await _auth.signOut();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    print('User signed out');
  }
}
