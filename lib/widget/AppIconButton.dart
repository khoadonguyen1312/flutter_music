import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Appiconbutton extends StatelessWidget {
  const Appiconbutton({super.key, required this.ontap, required this.iconData,this.size=20});
  final VoidCallback ontap;
  final IconData iconData;
  final double size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Icon(iconData,size: size,),
    );
  }
}
