import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {super.key,
      required this.label,
      required this.brand,
      required this.ontap});
  final String label;
  final Widget brand;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(97, 219, 231, 232),
              borderRadius: BorderRadius.circular(12.sp)),
          height: 59.sp,
          width: 377.sp,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 34.sp,
                width: 34.sp,
                child: brand,
              ),
              SizedBox(
                width: 12.sp,
              ),
              const Text("Sign in with "),
              Text(label)
            ],
          )),
    );
  }
}
