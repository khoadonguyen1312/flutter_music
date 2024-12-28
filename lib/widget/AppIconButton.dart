import 'package:flutter/material.dart';

class Appiconbutton extends StatelessWidget {
  const Appiconbutton({super.key, required this.ontap, required this.iconData});
  final VoidCallback ontap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Icon(iconData),
    );
  }
}
