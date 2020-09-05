import 'dart:async';

import 'package:TikTokUI/pages/VideoCam.dart';
import 'package:TikTokUI/pages/Views.dart';
import 'package:TikTokUI/theme/colors.dart';
import 'package:TikTokUI/widgets/left_panel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class FollowPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
//  final String albumImg;
  final int views;
  bool islike;
  FollowPlayerItem(
      {Key key,
      @required this.size,
      this.name,
      this.caption,
      this.songName,
      this.profileImg,
      this.likes,
      this.comments,
      this.shares,
      // this.albumImg,
      this.views,
      this.videoUrl})
      : super(key: key);

  final Size size;

  @override
  _FollowPlayerItemState createState() => _FollowPlayerItemState();
}

class _FollowPlayerItemState extends State<FollowPlayerItem> {
  VideoPlayerController _videoController;
  bool isShowPlaying = false;
  bool like = false;
  bool showOverlay = false;
  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoController.play();

        setState(() {
          isShowPlaying = false;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  Widget isPlaying() {
    return _videoController.value.isPlaying && !isShowPlaying
        ? Container()
        : Icon(
            Icons.play_arrow,
            size: 80,
            color: white.withOpacity(0.5),
          );
  }

  _doubleTapped() {
    setState(() {
      showOverlay = true;
      like = true;
      if (showOverlay) {
        Timer(const Duration(milliseconds: 800), () {
          setState(() {
            showOverlay = false;
          });
        });
      }
    });
  }

  _likePost() {
    setState(() {
      like = !like;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Scaffold(
        floatingActionButton: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _videoController.pause();
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VideoCamera()));
              },
              child: Center(
                child: Image.asset(
                  'assets/Middleone.png',
                  width: 45,
                  height: 45,
                ),
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: InkWell(
          onTap: () {
            setState(() {
              _videoController.value.isPlaying
                  ? _videoController.pause()
                  : _videoController.play();
            });
          },
          child: GestureDetector(
            onDoubleTap: _doubleTapped,
            child: RotatedBox(
              quarterTurns: 0,
              child: Container(
                  height: widget.size.height,
                  width: widget.size.width,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: widget.size.height,
                        width: widget.size.width,
                        decoration: BoxDecoration(color: black),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            VideoPlayer(_videoController),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(),
                                child: isPlaying(),
                              ),
                            ),
                            showOverlay
                                ? Container(
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 100,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      Container(
                        height: widget.size.height * 1,
                        width: widget.size.width * 1,
                        child: SafeArea(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 20, bottom: 10),
                                child: LeftPanel(
                                  size: widget.size,
                                  name: "${widget.name}",
                                  caption: "${widget.caption}",
                                  songName: "${widget.songName}",
                                  profileimg: "${widget.profileImg}",
                                ),
                              )),
                              SizedBox(
                                height: 20,
                              ),
                              //Bottom Bar//////////////////////////////////////////////////////////
                              BottomAppBar(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: Container(
                                    height: 70,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 13,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _likePost();
                                              },
                                              child: Container(
                                                  child: like
                                                      ? Stack(
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                              size: 33,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 25.0,
                                                              ),
                                                              child: Container(
                                                                width: 30,
                                                                height: 22,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border: Border.all(
                                                                        width:
                                                                            2.0,
                                                                        color: Colors
                                                                            .white70),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  widget.likes,
                                                                  style: GoogleFonts
                                                                      .pacifico(
                                                                          fontStyle: FontStyle
                                                                              .italic,
                                                                          fontSize:
                                                                              8,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          textStyle:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                          )),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : Stack(
                                                          children: <Widget>[
                                                            Icon(
                                                              FontAwesomeIcons
                                                                  .heart,
                                                              color:
                                                                  Colors.white,
                                                              size: 33,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 25.0,
                                                              ),
                                                              child: Container(
                                                                width: 30,
                                                                height: 22,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border: Border.all(
                                                                        width:
                                                                            2.0,
                                                                        color: Colors
                                                                            .black),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  widget.likes,
                                                                  style: GoogleFonts
                                                                      .pacifico(
                                                                          fontStyle: FontStyle
                                                                              .italic,
                                                                          fontSize:
                                                                              8,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          textStyle:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                          )),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                            ),
                                            // Text(
                                            //   widget.likes,
                                            //   style: TextStyle(color: Colors.white),
                                            // )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 13,
                                            ),
                                            Stack(
                                              children: <Widget>[
                                                Icon(
                                                  FontAwesomeIcons.commentDots,
                                                  color: Colors.white,
                                                  size: 33,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 25.0,
                                                  ),
                                                  child: Container(
                                                    width: 30,
                                                    height: 22,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                            width: 2.0,
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      widget.comments,
                                                      style:
                                                          GoogleFonts.pacifico(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 13,
                                            ),
                                            Stack(
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: () {
                                                    final RenderBox box =
                                                        context
                                                            .findRenderObject();
                                                    Share.share(
                                                        widget.profileImg,
                                                        subject: '',
                                                        sharePositionOrigin:
                                                            box.localToGlobal(
                                                                    Offset
                                                                        .zero) &
                                                                box.size);
                                                  },
                                                  child: Icon(
                                                    FontAwesomeIcons.share,
                                                    color: Colors.white,
                                                    size: 33,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 25.0,
                                                  ),
                                                  child: Container(
                                                    width: 30,
                                                    height: 22,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                            width: 2.0,
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      widget.shares,
                                                      style:
                                                          GoogleFonts.pacifico(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Stack(
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _videoController.pause();
                                                    });
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Views()));
                                                  },
                                                  child: Icon(
                                                    FontAwesomeIcons.solidEye,
                                                    color: Colors.white,
                                                    size: 35,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 25.0,
                                                  ),
                                                  child: Container(
                                                    width: 30,
                                                    height: 22,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                            width: 2.0,
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      widget.views.toString(),
                                                      style:
                                                          GoogleFonts.pacifico(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                          //  ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
