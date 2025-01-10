import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttermusic/service/yotutube/AppYtExplore.dart';
import 'package:fluttermusic/source/Appcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Topmixplaylistscreen extends StatefulWidget {
  const Topmixplaylistscreen(
      {super.key, required this.title, required this.img});

  final String title, img;

  @override
  State<Topmixplaylistscreen> createState() => _TopmixplaylistscreenState();
}

class _TopmixplaylistscreenState extends State<Topmixplaylistscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 36.sp,
            ),
            Align(
              alignment: Alignment.center,
              child: Hero(
                  tag: widget.img,
                  child: CachedNetworkImage(
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
            ),
            SizedBox(
              height: 21.sp,
            ),
            Text(
              widget.title,
              style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18.sp,
            ),
            Text("soft, chill, dreamy, lo-fi beats"),
            SizedBox(
              height: 41.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              child: FutureBuilder(
                future: YtExplore().search(widget.title),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return LoadingAnimationWidget.dotsTriangle(color: AppColor.primaryColor, size: 24.sp);
                  }
                  var data =snapshot.data;
                  return ListView.builder(
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data!.length,
                    itemBuilder:(context, index) {
                    return ListTile(
                      onTap: (){},
                      trailing: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.ellipsis_vertical)),
                      leading: CachedNetworkImage(
                        imageUrl: data![index].img,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 75.sp,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                ),
                          ),
                        ),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      title:Text(
                          maxLines: 2,
                        data![index].title ),);
                  },);
                },
              ),
            ),
            SizedBox(height: 24.sp,)
          ],
        ),
      ),
    );
  }
}
