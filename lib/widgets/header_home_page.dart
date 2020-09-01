import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:TikTokUI/widgets/moreOption.dart';

class HeaderHomePage extends StatefulWidget {
  const HeaderHomePage({
    Key key,
  }) : super(key: key);

  _HeaderHomePageState createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  void choiceAction(String choice) {}
  bool followbutton = true;
  bool explorebutton = false;
  void buttonFollowing() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: PopupMenuButton<String>(
              offset: const Offset(-70.0, 30),
              icon: new Icon(Icons.more_vert, color: Colors.white),
              onSelected: choiceAction,
              color: Colors.transparent,
              itemBuilder: (BuildContext context) {
                return MoreOption.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(
                      choice,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList();
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .085,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                followbutton = true;
                explorebutton = false;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: followbutton
                  ? BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 2.0, color: Colors.white70)))
                  : BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 2.0, color: Colors.transparent))),
              child: Text("Following",
                  style: GoogleFonts.pacifico(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      textStyle: TextStyle(
                        color: Colors.white,
                      ))),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * .085),
          GestureDetector(
            onTap: () {
              setState(() {
                followbutton = false;
                explorebutton = true;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: explorebutton
                  ? BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 2.0, color: Colors.white70)))
                  : BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 2.0, color: Colors.transparent))),
              child: Text("Explore",
                  style: GoogleFonts.pacifico(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      textStyle: TextStyle(
                        color: Colors.white,
                      ))),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .08,
          ),
          CircleAvatar()
        ],
      ),
    );
  }
}
