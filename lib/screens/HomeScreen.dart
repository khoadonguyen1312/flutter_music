import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermusic/screens/PlaylistScreen.dart';
import 'package:fluttermusic/screens/SettingScreen.dart';
import 'package:fluttermusic/service/musicPlayer/AudioPlayer_imp.dart';
import 'package:fluttermusic/service/realtimedatabase/RealTimeDb.dart';
import 'package:fluttermusic/service/realtimedatabase/SearchDb.dart';
import 'package:fluttermusic/source/Appcolor.dart';
import 'package:fluttermusic/ultil.dart';
import 'package:fluttermusic/widget/ContinutePlay.dart';
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
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 90.sp,
        backgroundColor: Colors.transparent,
        title: ListTile(
          subtitle: Text(
            "Khoadonguyen1312",
            style: TextStyle(fontSize: 12.sp),
          ),
          title: Text(
            "Wellcome!",
            style: TextStyle(fontSize: 15.sp),
          ),
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://i.pinimg.com/originals/7a/88/2a/7a882ab5c4fba435f0c93f44ab461420.jpg"),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                pushNewScreen(PlayListScreen(), context);
              },
              icon: Icon(
                CupertinoIcons.chart_bar,
                size: 20.sp,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.bell,
                size: 20.sp,
              )),
          IconButton(
              onPressed: () {
                pushNewScreen(const Settingscreen(), context);
              },
              icon: Icon(
                CupertinoIcons.gear,
                size: 20.sp,
              ))
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
                Consumer<AudioplayerImp>(
                  builder: (context, value, child) {
                    return TextButton(
                        onPressed: () async {
                          print(value.playing);
                        },
                        child: const Text("esav"));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
