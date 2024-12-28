import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermusic/screens/ExploreScreen.dart';
import 'package:fluttermusic/screens/HomeScreen.dart';
import 'package:fluttermusic/screens/LibraryScreen.dart';
import 'package:fluttermusic/screens/SignInScreen.dart';
import 'package:fluttermusic/service/auth/FirebaseAuth.dart';
import 'package:fluttermusic/service/musicPlayer/AudioPlayer_imp.dart';
import 'package:fluttermusic/service/musicPlayer/BottomMusicPlayer.dart';

import 'package:fluttermusic/source/AppTheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BottomTab extends StatelessWidget {
  const BottomTab({super.key});

  @override
  Widget build(BuildContext context) {
    late int currentPage = 0;
    return MultiProvider(
        builder: (context, child) {
          return ScreenUtilInit(
            designSize: const Size(422, 922),
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.normal,
                home: DefaultTabController(
                    length: 3,
                    child: Consumer<FireBaseAuthMethod>(
                      builder: (context, value, child) {
                        return value.auth
                            ? Scaffold(
                                bottomSheet: const BottomAudio(),
                                body: const TabBarView(children: [
                                  HomeScreen(),
                                  ExploreScreen(),
                                  LibraryScreen()
                                ]),
                                bottomNavigationBar: SizedBox(
                                  height: 70,
                                  child: TabBar(
                                      splashFactory: NoSplash.splashFactory,
                                      labelStyle: TextStyle(fontSize: 16.sp),
                                      tabs: List.generate(
                                          _navitems.length,
                                          (i) => Tab(
                                                text: _navitems[i].label,
                                                icon: Icon(
                                                  _navitems[i].icon,
                                                  size: 17.sp,
                                                ),
                                              ))),
                                ),
                              )
                            : const Signinscreen();
                      },
                    )),
              );
            },
          );
        },
        providers: [
          ChangeNotifierProvider(
            create: (context) =>
                FireBaseAuthMethod(FirebaseAuth.instance, context),
          ),
          ChangeNotifierProvider(
            create: (context) => AudioplayerImp(),
          ),
          ChangeNotifierProvider(
            create: (context) =>
                FireBaseAuthMethod(FirebaseAuth.instance, context),
          )
        ]);
  }
}

class _Navitem {
  const _Navitem({required this.label, required this.icon});
  final String label;
  final IconData icon;
}

List<_Navitem> _navitems = [
  const _Navitem(label: "Home", icon: FontAwesomeIcons.home),
  const _Navitem(label: "Explore", icon: FontAwesomeIcons.search),
  const _Navitem(label: "Library", icon: FontAwesomeIcons.folder)
];
