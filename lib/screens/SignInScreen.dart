import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermusic/service/auth/FirebaseAuth.dart';
import 'package:fluttermusic/widget/socialButton.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FireBaseAuthMethod>(
      builder: (context, value, child) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 76.sp,
                ),
                Container(
                  height: 254.sp,
                  width: 354.sp,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 32.sp,
                ),
                Text("Let’s get you in"),
                SizedBox(
                  height: 45.sp,
                ),
                TextButton(
                    onPressed: () async {
                      value.googleSignIn();
                    },
                    child: Text("Google sign in"))
              ],
            ),
          ),
        );
      },
    );
  }
}
