import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttermusic/service/musicPlayer/AudioPlayer_imp.dart';
import 'package:fluttermusic/source/Appcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({super.key});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AudioplayerImp>(
      builder: (context, value, child) {
        if(value.audioplayermodel.playlist.isEmpty){
          return Scaffold(body: Center(child: Text("Playlist trong"),),);
        }
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0.0,
            surfaceTintColor: Colors.transparent,
            title: ListTile(
              trailing: Padding(
                padding: EdgeInsets.only(top: 16.sp),
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColor.primaryColor, size: 23.sp),
              ),
              title: const Text(
                "Bài hát đang phát",
              ),
              subtitle: Text(
                maxLines: 1,
                value.audioplayermodel.nowSong.title,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ),
          body: value.audioplayermodel.playlist.isNotEmpty
              ? ListView.builder(
                  itemCount: value.audioplayermodel.playlist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        value.seekToSong(index);
                      },

                      tileColor: value.check_is_playing(
                              value.audioplayermodel.playlist[index].id)
                          ? AppColor.primaryColor.withOpacity(0.3)
                          : Colors.transparent,
                      leading: CachedNetworkImage(
                        imageUrl: value.audioplayermodel.playlist[index].img,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 85.sp,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                ),
                          ),
                        ),
                        placeholder: (context, url) => Container(width: 85.sp,color: Colors.black12,),
                        errorWidget: (context, url, error) =>const Icon(Icons.error),
                      ),
                      title: Text(value.audioplayermodel.playlist[index].title,),
                    );
                  },
                )
              : const Center(
                  child: Text("Không có bài hát trong danh sách phát"),
                ),
        );
      },
    );
  }
}
