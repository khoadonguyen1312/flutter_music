import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Headingtext extends StatelessWidget {
  const Headingtext({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 25.sp),
      title: Text(
        text,
        style: TextStyle(fontSize: 20.sp),
      ),
    );
  }
}
