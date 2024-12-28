import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseOnYou extends StatelessWidget {
  const BaseOnYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182.sp,
      width: 1.sw,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _Item();
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 36.sp,
        ),
        Container(
          height: 182.sp,
          width: 182.sp,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      'https://i3.ytimg.com/vi/86htdJAHF-E/maxresdefault.jpg'))),
        ),
      ],
    );
  }
}
