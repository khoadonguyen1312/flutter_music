import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
class Topmixplaylistscreen extends StatefulWidget {
  const Topmixplaylistscreen({super.key,required this.title,required this.img});
  final String title,img;

  @override
  State<Topmixplaylistscreen> createState() => _TopmixplaylistscreenState();
}

class _TopmixplaylistscreenState extends State<Topmixplaylistscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,title: Text(widget.title),),
      body: SingleChildScrollView(child: Column(children: [
       Hero(tag: widget.img, child:  CachedNetworkImage(
         imageUrl: widget.img,
         imageBuilder: (context, imageProvider) => Container(
           height: 252.sp,
           width: 263.sp,
           decoration: BoxDecoration(
             image: DecorationImage(
               image: imageProvider,
               fit: BoxFit.cover,
             ),
           ),
         ),
         placeholder: (context, url) => CircularProgressIndicator(),
         errorWidget: (context, url, error) => Icon(Icons.error),
       )),

      ],),),
    );
  }
}
