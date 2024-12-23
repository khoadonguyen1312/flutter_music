import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermusic/model/SongModel.dart';
import 'package:fluttermusic/service/musicPlayer/AudioPlayer_imp.dart';
import 'package:fluttermusic/service/realtimedatabase/RealTimeDb.dart';
import 'package:fluttermusic/service/realtimedatabase/SearchDb.dart';
import 'package:fluttermusic/service/yotutube/AppYtExplore.dart';
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

class _SearchDelegete extends SearchDelegate {
  _SearchDelegete() : super(searchFieldStyle: TextStyle(fontSize: 16.sp));
  Future<void> _addQuery(BuildContext context) async {
    await Provider.of<Searchdb>(context, listen: false).push(query);
  }

  Future<void> getall(BuildContext context, Future future) async {
    await future;
  }

  @override
  List<Widget>? buildActions(Object context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(CupertinoIcons.arrow_left),
      onPressed: () {
        query = '';
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (!Provider.of<Searchdb>(context, listen: false).items.contains(query)) {
      _addQuery(context);
    }

    return FutureBuilder(
      future: YtExplore().search(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Có lỗi khi tìm kiếm");
        } else {
          List<Song> data;
          data = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              var provider = Provider.of<AudioplayerImp>(context);
              return ListTile(
                onTap: () async {
                  await provider.startAudio(data[index]);
                },
                leading: Image.network(data[index].img),
                title: Text(data[index].title),
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> slug = [];
    return Consumer<Searchdb>(
      builder: (context, value, child) {
        getall(context, value.getAll());
        return ListView.builder(
          itemCount: value.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(value.items[index]),
            );
          },
        );
      },
    );
  }
}
