import 'package:TikTokUI/constant/data_json.dart';
import 'package:TikTokUI/theme/colors.dart';
import 'package:TikTokUI/widgets/actiontoolbar.dart';
import 'package:TikTokUI/widgets/header_home_page.dart';
import 'package:TikTokUI/widgets/left_panel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  // bool like = false;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  // _doubleTappesmallheartGlow() {
  //   setState(() {
  //     like = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0),
        actions: <Widget>[HeaderHomePage()],
      ),
      extendBodyBehindAppBar: true,
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(
          'assets/videocam.png',
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(items.length, (index) {
          return VideoPlayerItem(
            videoUrl: items[index]['videoUrl'],
            size: size,
            name: items[index]['name'],
            caption: items[index]['caption'],
            songName: items[index]['songName'],
            profileImg: items[index]['profileImg'],
            likes: items[index]['likes'],
            comments: items[index]['comments'],
            shares: items[index]['shares'],
            albumImg: items[index]['albumImg'],
          );
        }),
      ),
    );
  }
}
//=================================================================

//=================================================================

// ignore: must_be_immutable
class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  bool islike;
  VideoPlayerItem(
      {Key key,
      @required this.size,
      this.name,
      this.caption,
      this.songName,
      this.profileImg,
      this.likes,
      this.comments,
      this.shares,
      this.albumImg,
      this.videoUrl})
      : super(key: key);

  final Size size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
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
    return InkWell(
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
          quarterTurns: -1,
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
                              albumImg: "${widget.albumImg}",
                            ),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          BottomAppBar(
                              child: Container(
                            height: 70,
                            color: Colors.black,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: _likePost,
                                      child: Container(
                                          child: like
                                              ? Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                  size: 28,
                                                )
                                              : Icon(
                                                  Icons.favorite,
                                                  color: Colors.white,
                                                  size: 28,
                                                )),
                                    ),
                                    Text(
                                      widget.likes,
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  FontAwesomeIcons.commentDots,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Icon(
                                  FontAwesomeIcons.share,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  FontAwesomeIcons.solidEye,
                                  color: Colors.white,
                                  size: 28,
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
    );
  }
}

// class RightPanel extends StatelessWidget {
//   final String likes;
//   final String comments;
//   final String shares;
//   final String profileImg;
//   final String albumImg;
//   const RightPanel({
//     Key key,
//     @required this.size,
//     this.likes,
//     this.comments,
//     this.shares,
//     this.profileImg,
//     this.albumImg,
//   }) : super(key: key);

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         height: size.height,
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: size.height * 0.3,
//             ),
//             Expanded(
//                 child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 getProfile(profileImg),
//                 getIcons(FontAwesomeIcons.heart, likes, 35.0),
//                 getIcons(FontAwesomeIcons.comment, comments, 35.0),
//                 getIcons(FontAwesomeIcons.reply, shares, 25.0),
//                 getAlbum(albumImg)
//               ],
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
