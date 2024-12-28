import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermusic/model/SongModel.dart';

class Continute extends StatelessWidget {
  const Continute({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(left: 29.sp, right: 16.sp),
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.sp,
          crossAxisSpacing: 13.sp,
          childAspectRatio: 182 / 57),
      itemBuilder: (context, index) {
        return const _Item();
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
      tileColor: Color(0xff436369).withOpacity(0.2),
      titleTextStyle: TextStyle(fontSize: 12.sp),
      title: Text(
        'Nắng Ấm Xa Dần - Sơn Tùng M-TP',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        height: 54.sp,
        width: 54.sp,
        child: Image.network(
            fit: BoxFit.fitHeight,
            'https://i3.ytimg.com/vi/-Vv7sSLnhlU/maxresdefault.jpg'),
      ),
    ));
  }
}
