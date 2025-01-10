import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermusic/screens/PlaylistScreen.dart';
import 'package:fluttermusic/screens/SettingScreen.dart';
import 'package:fluttermusic/service/auth/FirebaseAuth.dart';

import 'package:fluttermusic/source/Appcolor.dart';
import 'package:fluttermusic/ultil.dart';
import 'package:fluttermusic/widget/AppIconButton.dart';
import 'package:fluttermusic/widget/BasedOnYou.dart';
import 'package:fluttermusic/widget/ContinutePlay.dart';
import 'package:fluttermusic/widget/HeadingText.dart';
import 'package:fluttermusic/widget/TopMix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(

      )
      ,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90.sp,
        backgroundColor: Colors.transparent,
        title: const UserInfo(),
        actions: [
          Appiconbutton(
            size: 26.sp,
              ontap: () {
              pushNewScreen(PlayListScreen(), context);

              }, iconData: CupertinoIcons.chart_bar_alt_fill),
          SizedBox(
            width: 17.sp,
          ),
          Appiconbutton(
              size: 26.sp,
              ontap: () {}, iconData: CupertinoIcons.bell),
          SizedBox(
            width: 17.sp,
          ),
          Appiconbutton(
              size: 26.sp,
              ontap: () {
                  pushNewScreen(Settingscreen(), context);

              }, iconData: CupertinoIcons.gear),
          SizedBox(
            width: 23.sp,
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 150.sp,
            width: 1.sw,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColor.primaryColor, AppColor.backgroundColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 123.sp,
                ),
                const Headingtext(text: "Continue Listening"),
                const Continute(),
                const Headingtext(text: 'Your Top Mixes'),
                const TopMix(),
                const Headingtext(text: 'Based on your recent listening'),
                const BaseOnYou()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FireBaseAuthMethod>(
      builder: (context, value, child) {
        return ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          subtitle: Text(
            value.user!.displayName!,
            style: TextStyle(fontSize: 12.sp),
          ),
          title: Text(
            "Wellcome!",
            style: TextStyle(fontSize: 16.sp),
          ),
          leading: InkWell(
            onTap: (){
                Scaffold.of(context).openDrawer();

            },
            child: SizedBox(
              height: 34.sp,
              width: 34.sp,
              child: CircleAvatar(
                backgroundImage: NetworkImage(value.user!.photoURL.toString()),
              ),
            ),
          ),
        );
      },
    );
  }
}
