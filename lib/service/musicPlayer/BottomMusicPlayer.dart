import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermusic/screens/SongScreen.dart';
import 'package:fluttermusic/service/musicPlayer/AudioPlayer_imp.dart';
import 'package:fluttermusic/source/Appcolor.dart';
import 'package:fluttermusic/ultil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomAudio extends StatefulWidget {
  const BottomAudio({super.key});

  @override
  State<BottomAudio> createState() => _BottomAudioState();
}

class _BottomAudioState extends State<BottomAudio> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AudioplayerImp>(
      builder: (context, audioplayer, child) {
        String thumb =audioplayer.audioplayermodel.nowSong.img;
        String title =audioplayer.audioplayermodel.nowSong.title;
        return  Dismissible(
              direction: DismissDirection.horizontal,
              onDismissed: (direction) async {
                audioplayer.stop();
                print("dừng phát nhạc");
              },
              key: Key("id"),
              child: Visibility(
                visible: audioplayer.audioplayermodel.playlist.isNotEmpty,
                child: Container(
                  width: 1.sw,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    children: [
                      ListTile(
                        leading: InkWell(
                          onTap:(){
                            pushNewScreen(Songscreen(), context);
                          } ,
                          child: Hero(
                            tag: thumb,
                            child: CachedNetworkImage(
                                            imageUrl: thumb,
                                              imageBuilder: (context, imageProvider) => Container(

                                                width: 54.sp,
                                                decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                                                ),
                                              ),
                                              placeholder: (context, url) => CircularProgressIndicator(),
                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                            ),
                          ),
                        ),

                        subtitle: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              Duration(
                                      seconds: audioplayer.now_duration.inSeconds)
                                  .toString()
                                  .replaceAll(RegExp(r'0*$'), '')
                                  .replaceAll(RegExp(r'\.$'), ''),
                            ),
                            const Text(" / "),
                            Text(
                              style:
                                  const TextStyle(color: AppColor.primaryColor),
                              Duration(
                                      seconds: audioplayer.audioplayermodel
                                          .nowSong.duration.inSeconds)
                                  .toString()
                                  .replaceAll(RegExp(r'0*$'), '')
                                  .replaceAll(RegExp(r'\.$'), ''),
                            )
                          ],
                        ),
                        horizontalTitleGap: 28.sp,
                        title: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child:
                                      const Icon(FontAwesomeIcons.backwardStep),
                                ),
                                SizedBox(
                                  width: 16.sp,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(CupertinoIcons.pause),
                                ),
                                SizedBox(
                                  width: 16.sp,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(FontAwesomeIcons.forwardStep),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 12.sp,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -24.sp,
                        child: SizedBox(
                          width: 1.sw,
                          child: SliderTheme(
                            data: SliderThemeData(
                                trackHeight: 1.sp,
                                thumbColor: AppColor.progressBarColor,
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 1)),
                            child: Slider(
                              max: audioplayer
                                  .audioplayermodel.nowSong.duration.inSeconds
                                  .toDouble(),
                              value:
                                  audioplayer.now_duration.inSeconds.toDouble(),
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
      },
    );
  }
}
