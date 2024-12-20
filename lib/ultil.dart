import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppImage extends StatelessWidget {
  const AppImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

void pushNewScreen(Widget screen, BuildContext context,
    {PageTransitionType? type = PageTransitionType.fade}) {
  Navigator.push(
      context, PageTransition(child: screen, type: PageTransitionType.fade));
}
