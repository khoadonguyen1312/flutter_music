import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  @override
  List<Widget>? buildActions(Object context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(CupertinoIcons.arrow_left),
      onPressed: () {
        query = '';
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return ListTile(
      title: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> slug = [];
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("noi nay co anh"),
        );
      },
    );
  }
}
