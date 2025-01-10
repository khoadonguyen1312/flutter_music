import 'package:cached_network_image/cached_network_image.dart';
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
        itemCount: 5,
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
    CachedNetworkImage(
    imageUrl: "http://i3.ytimg.com/vi/ppqxBjkziqo/hqdefault.jpg",
    imageBuilder: (context, imageProvider) => Container(
    height: 182.sp,
    width: 182.sp,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: imageProvider,
    fit: BoxFit.cover,
    ),
    ),
    ),
    placeholder: (context, url) =>Container(height: 182.sp,width: 182.sp,
    color: Colors.black38,
    ),
    errorWidget: (context, url, error) =>const Icon(Icons.error),
    ),

      ],
    );
  }
}
