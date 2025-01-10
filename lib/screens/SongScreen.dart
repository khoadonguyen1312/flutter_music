import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermusic/service/musicPlayer/AudioPlayer_imp.dart';
import 'package:fluttermusic/source/Appcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Songscreen extends StatefulWidget {
  const Songscreen({super.key});

  @override
  State<Songscreen> createState() => _SongscreenState();
}

class _SongscreenState extends State<Songscreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AudioplayerImp>(
      builder: (context, audioplayer, child) {
        String title = audioplayer.audioplayermodel.nowSong.title;
        String img = audioplayer.audioplayermodel.nowSong.img;
        return Scaffold(
          appBar: AppBar(

            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.ellipsis_vertical,
                    size: 20.sp,
                  ))
            ],
            title: ListTile(
              title: Text(
                "PLAYING FROM PLAYLIST:",
                style: TextStyle(fontSize: 9.sp),
              ),
              subtitle: Text(title,maxLines: 1,style: TextStyle(color: AppColor.primaryColor),),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40.sp,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: img,
                    child: CachedNetworkImage(
                      imageUrl: img,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 330.sp,
                        width: 345.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => CachedNetworkImage(
                        imageUrl: "https://media.tenor.com/KEzW7ALwfUAAAAAM/cat-what.gif",
                        imageBuilder: (context, imageProvider) => Container(
                          height: 330.sp,
                          width: 345.sp,
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
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 44.sp,),
                  child: Row(
                    children: [
                      SizedBox(width: 262.sp, child: Text(title)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 44.sp,right: 44.sp),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(""),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.shareAlt,
                                size: 24.sp,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.heart,
                                size: 24.sp,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 18.sp),child: SliderTheme(
                  data: SliderThemeData(
                      thumbColor: AppColor.primaryColor,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 2)),
                  child: Slider(
                    value: audioplayer.now_duration.inSeconds.toDouble(),
                    max: audioplayer.audioplayermodel.nowSong.duration.inSeconds.toDouble()+2,
                    onChanged: (val) {
                        audioplayer.seekto(Duration(seconds: val.toInt()));
                    })
                ),),
                Padding(padding: EdgeInsets.symmetric(horizontal: 22.sp),child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.repeat,size: 24.sp,)),
                    IconButton(onPressed: (){
                        audioplayer.backSong();

                    }, icon: Icon(CupertinoIcons.backward_end,size: 24.sp,)),
                _PlayButton(ontap: () {
                      audioplayer.pause();
                }, play: audioplayer.playing),
                    IconButton(onPressed: (){
                      audioplayer.nextSong();

                    }, icon: Icon(CupertinoIcons.forward_end,size: 24.sp,)),

                    IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.add,size: 24.sp,)),
                ],),)
              ],
            ),
          ),
        );
      },
    );
  }
}


class _PlayButton extends StatelessWidget {
  const _PlayButton({super.key,required this.ontap,required this.play});
  final VoidCallback ontap;
  final bool play;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.sp),
      onTap: ontap,child: Container(
      child: Icon(play? Icons.play_arrow:Icons.pause),
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          shape: BoxShape.circle),
      height: 56.sp,width: 56.sp,),);
  }
}
