import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermusic/model/SongModel.dart';
import 'package:fluttermusic/service/musicPlayer/AudioPlayer_imp.dart';
import 'package:fluttermusic/service/realtimedatabase/Impl/RealTimeDbimpl.dart';
import 'package:fluttermusic/service/yotutube/AppYtExplore.dart';
import 'package:fluttermusic/source/Appcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                  showSearch(context: context, delegate: _SearchDelegete());

              },
              icon: Icon(
                CupertinoIcons.search,
                size: 18.sp,
              ))
        ],
      ),
    );
  }
}

class _SearchDelegete extends SearchDelegate{
  final YtExplore ytExplore =YtExplore();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
        query="";
        Navigator.pop(context);

    }, icon: Icon(CupertinoIcons.clear,size: 20.sp,));
  }
  @override
  Widget buildResults(BuildContext context)  {
    Future<dynamic> future = Future.value(ytExplore.search(query));
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: LoadingAnimationWidget.beat(
                    color: AppColor.primaryColor,
                    size: 20.sp,
                  ),
                ),
                Text("Dang tim kiem")
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error"),
          );
        }
        dynamic data =snapshot.data;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder:(context, index) {
          return ListTile(

            onTap: () {

                Provider.of<AudioplayerImp>(context,listen: false).startAudio(data[index], context);
                Provider.of<RealTimeDBImpl>(context,listen: false).pushHistory(data![index]);
            },
            leading:CachedNetworkImage(
            imageUrl: data[index].img,
            imageBuilder: (context, imageProvider) => Container(
              width: 95.sp,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    ),
              ),
            ),
            placeholder: (context, url) => LoadingAnimationWidget.twoRotatingArc(color: AppColor.primaryColor, size: 20.sp),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),title:Text( data[index].title), );
        },);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Future<dynamic> future = Future.value(ytExplore.search(query));
    return Center(child: Text("Tim kiem"),);
  }

}