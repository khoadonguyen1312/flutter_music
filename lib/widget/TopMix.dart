import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermusic/ultil.dart';

class TopMix extends StatelessWidget {
  const TopMix({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.sp,
      width: 1.sw,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
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
          width: 26.sp,
        ),
        InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                height: 150.sp,
                width: 150.sp,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.7,
                        image: NetworkImage(
                            'https://i.ytimg.com/vi/y_FkQ2jHd1c/maxresdefault.jpg'))),
              ),
              Positioned(
                  left: 24.sp,
                  top: 9.sp,
                  child: Text(
                    'Edm',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 8.sp,
                  width: 150.sp,
                  decoration: BoxDecoration(color: AppRandomColor()),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
