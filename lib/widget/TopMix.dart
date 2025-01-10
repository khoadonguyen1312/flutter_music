import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermusic/screens/TopMixPlayListScreen.dart';
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
        itemCount:_items.length ,
        itemBuilder: (context, index) {
          return _Item(model:_items[index] ,ontap: () {
            pushNewScreen(Topmixplaylistscreen(title: _items[index].title, img: _items[index].thumb), context);
          },);
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key,required this.model,required this.ontap});
  final _Model model;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 26.sp,
        ),
        InkWell(
          onTap: ontap,
          child: Stack(
            children: [
             Hero(tag: model.thumb, child:  CachedNetworkImage(
               imageUrl:
               model.thumb,
               imageBuilder: (context, imageProvider) => Container(
                 height: 150.sp,
                 width: 150.sp,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     opacity: 0.8,
                     image: imageProvider,
                     fit: BoxFit.cover,
                   ),
                 ),
               ),
               placeholder: (context, url) => Container(
                 height: 150.sp,
                 width: 150.sp,
                 color: Colors.black26,
               ),
               errorWidget: (context, url, error) => const Icon(Icons.error),
             ),),
              Positioned(
                  left: 24.sp,
                  top: 9.sp,
                  child: Text(
                    model.title,
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

List<_Model> _items = [
  _Model(
      thumb:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDb-nSWORTJjvcMxkcn61cpK6Jj_vVrYSzTw&s",
      title: "pop"),
  _Model(thumb: "https://thumbs.dreamstime.com/z/edm-dj-party-music-club-concept-hand-drawn-isolated-vector-edm-dj-party-music-club-concept-hand-drawn-dj-play-music-edm-party-143726911.jpg", title: "Edm")
];

class _Model {
  const _Model({required this.thumb, required this.title});

  final String thumb, title;
}
