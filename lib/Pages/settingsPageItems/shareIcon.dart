import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareIcon extends StatelessWidget {
  final String url;
  final String imageUrl;

  const ShareIcon({Key? key, required this.url, required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launch(url);
      },
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
