import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermusic/model/SongModel.dart';
import 'package:fluttermusic/service/musicPlayer/AudioPlayer_imp.dart';
import 'package:fluttermusic/service/realtimedatabase/Impl/RealTimeDbimpl.dart';
import 'package:provider/provider.dart';

class Continute extends StatelessWidget {
  const Continute({super.key});

  @override
  Widget build(BuildContext context) {
    var future =Provider.of<RealTimeDBImpl>(context).gAllHistory();
    return FutureBuilder(future:future, builder:(context, snapshot) {
      dynamic data =snapshot.data;
      return GridView.builder(
        padding: EdgeInsets.only(left: 29.sp, right: 16.sp),
        shrinkWrap: true,
        itemCount: data.length<6? data.length:6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.sp,
            crossAxisSpacing: 13.sp,
            childAspectRatio: 182 / 57),
        itemBuilder: (context, index) {
          return _Item(song: data[index],ontap: () {
            Provider.of<AudioplayerImp>(context,listen: false).startAudio(data[index], context);
          },);
        },
      );
    },);
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.song,required this.ontap});
  final Song song;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(

        child: ListTile(
          onTap: ontap,
    contentPadding: EdgeInsets.only(left: 4.sp,top: 2.sp),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
      tileColor: Color(0xff436369).withOpacity(0.2),
      titleTextStyle: TextStyle(fontSize: 12.sp),
      title: Text(
        song.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      leading: CachedNetworkImage(
        imageUrl: song.img,
        imageBuilder: (context, imageProvider) => Container(
          height: 54.sp,
          width: 54.sp,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                ),
          ),
        ),
        placeholder: (context, url) => Text(""),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    ));
  }
}






