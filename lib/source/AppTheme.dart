import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColor {
  static const Color primaryColor = Color(0xFF6200EA);
  static const Color backgroundColor = Color(0xFF121212);
}

class AppTheme {
  static ThemeData normal = ThemeData(
    fontFamily: "centurygothic",
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.backgroundColor,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    ),
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