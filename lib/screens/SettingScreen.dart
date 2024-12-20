import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: Icon(CupertinoIcons.arrow_left_to_line_alt),
            title: Text("Log out"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
