import 'dart:async';

import 'package:TikTokUI/animation/FadeAnimation.dart';
import 'package:TikTokUI/screens/login.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class Splash extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<Splash> {
  VideoPlayerController _controller;
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login())));
    _controller = VideoPlayerController.asset('assets/Intro_Large.mp4')
    ..initialize().then((_) {
      setState(()  {

      });
    });
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(100.0);
  }
  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new Container(
                  child: _controller.value.initialized ? AspectRatio(aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                  : Container(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget> [
                  new Container(
                    child: FadeAnimation(4.0, Text("LYF Line",style: TextStyle(fontSize: 68.0,color: Colors.white,fontFamily: 'Pacifico'),),
                    ),
                  ),
                  SizedBox(height: 60.0,),
                ],
              )
            ],
          ),
        ),
    );
  }
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () {
              _controller.pause();
              Navigator.of(context).pop(true);},
            child: Text("YES"),
          ),
        ],
      ),
    ) ?? false;
  }
}
