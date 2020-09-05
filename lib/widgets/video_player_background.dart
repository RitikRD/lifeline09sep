import 'package:TikTokUI/theme/colors.dart';
import 'package:flutter/material.dart';

class VideoPlayerBackground extends StatelessWidget {
  final String img;
  const VideoPlayerBackground({
    Key key,
    @required this.size,
    this.img,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: black,
        ));
  }
}
