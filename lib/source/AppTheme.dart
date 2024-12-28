import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermusic/source/Appcolor.dart';

class AppTheme {
  static ThemeData normal = ThemeData(
    splashFactory: InkSplash.splashFactory,
    fontFamily: "centurygothic",
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.backgroundColor,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              TextStyle(fontSize: 12.sp),
            ),
            iconSize: WidgetStatePropertyAll(12.sp))),
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      subtitleTextStyle: TextStyle(
        fontSize: 10.sp,
        color: Colors.grey.shade400,
      ),
      dense: true,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primaryColor,
      brightness: Brightness.dark,
    ),
  );
}
