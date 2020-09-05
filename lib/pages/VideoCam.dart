import 'package:flutter/material.dart';

class VideoCamera extends StatefulWidget {
  @override
  _VideoCameraState createState() => _VideoCameraState();
}

class _VideoCameraState extends State<VideoCamera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('Video Cam'),
        ));
  }
}
