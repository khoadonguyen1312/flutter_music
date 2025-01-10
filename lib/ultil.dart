import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:fluttermusic/source/Appcolor.dart';
import 'package:page_transition/page_transition.dart';

class AppImage extends StatelessWidget {
  const AppImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

void pushNewScreen(Widget screen, BuildContext context,
    {PageTransitionType? type = PageTransitionType.fade}) {
  Navigator.push(
      context, PageTransition(
      duration: Duration(milliseconds: 300),
      child: screen, type: PageTransitionType.fade));
}

class AppIcon {
  static const Icon back = Icon(CupertinoIcons.backward_end);
  static const Icon forward = Icon(CupertinoIcons.forward_end);
}

Color AppRandomColor() {
  Color color = RandomColor.getColorObject(Options(
    colorType: ColorType.blue,
    luminosity: Luminosity.light,
  ));
  return color;
}
