import 'package:TikTokUI/constant/data_json.dart';
import 'package:TikTokUI/pages/UserPage.dart';
import 'package:TikTokUI/pages/VideoCam.dart';
import 'package:TikTokUI/pages/BuildMoreOption.dart';
//import 'package:TikTokUI/pages/Views.dart';
//import 'package:TikTokUI/theme/colors.dart';
import 'package:TikTokUI/widgets/ExploreTabView.dart';
//import 'package:TikTokUI/widgets/left_panel.dart';
import 'package:TikTokUI/widgets/moreOption.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:share/share.dart';
// import 'package:video_player/video_player.dart';
// import 'dart:async';
import 'package:TikTokUI/widgets/FollowingplayerItem.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool like = false;
  void initState() {
    super.initState();

    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void choiceAction(String choice) {}
  bool followbutton = true;
  bool explorebutton = false;
  void buttonFollowing() {}
  // Future<bool> _onBackPressed() {
  //   return showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             title: Text('Do you want to exit the app'),
  //             actions: <Widget>[
  //               FlatButton(
  //                   onPressed: () => {Navigator.pop(context, false)},
  //                   child: Text('No')),
  //               FlatButton(
  //                   onPressed: () => {Navigator.pop(context, true)},
  //                   child: Text('Yes'))
  //             ],
  //           ));
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Row(
            children: <Widget>[
              PopupMenuButton<String>(
                elevation: 0,
                offset: const Offset(-70.0, 30),
                icon: new Icon(Icons.more_vert, color: Colors.white),
                onSelected: choiceAction,
                color: Colors.transparent.withOpacity(0),
                itemBuilder: (BuildContext context) {
                  return MoreOption.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BuildMoreOption(choice)))
                        },
                        child: Text(
                          choice,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          elevation: 0,
          title: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: GoogleFonts.pacifico(
                fontStyle: FontStyle.italic,
                fontSize: MediaQuery.of(context).textScaleFactor * 16,
                textStyle: TextStyle(
                  color: Colors.white,
                )),
            tabs: <Widget>[
              Tab(
                text: "Following",
              ),
              Tab(
                text: "Explore",
              ),
            ],
          ),
          backgroundColor: Colors.transparent.withOpacity(0),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserPage()));
                },
                child: CircleAvatar(),
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: TabBarView(
          children: <Widget>[
            getFollowingBody(),
            getExploreBody(),
          ],
        ),
        // floatingActionButton: Container(
        //   width: 80,
        //   height: 80,
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: FloatingActionButton(
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => VideoCamera()));
        //       },
        //       child: Center(
        //         child: Image.asset(
        //           'assets/Middleone.png',
        //           width: 45,
        //           height: 45,
        //         ),
        //       ),
        //       backgroundColor: Colors.white,
        //     ),
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget getFollowingBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(items.length, (index) {
          return FollowPlayerItem(
            videoUrl: items[index]['videoUrl'],
            size: size,
            name: items[index]['name'],
            caption: items[index]['caption'],
            songName: items[index]['songName'],
            profileImg: items[index]['profileImg'],
            likes: items[index]['likes'],
            comments: items[index]['comments'],
            shares: items[index]['shares'],
            views: items[index]['views'] ?? 10,
          );
        }),
      ),
    );
  }

  getExploreBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(items.length, (index) {
          return ExplorePlayerItem(
            videoUrl: items[index]['videoUrl'],
            size: size,
            name: items[index]['name'],
            caption: items[index]['caption'],
            songName: items[index]['songName'],
            profileImg: items[index]['profileImg'],
            likes: items[index]['likes'],
            comments: items[index]['comments'],
            shares: items[index]['shares'],
            views: items[index]['views'] ?? 10,
          );
        }),
      ),
    );
  }
}
