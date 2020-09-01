import 'package:TikTokUI/theme/colors.dart';
import 'package:TikTokUI/widgets/FollowPerson.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  final String songName;
  final String albumImg;
  const LeftPanel({
    Key key,
    @required this.size,
    this.name,
    this.caption,
    this.songName,
    this.albumImg,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 1,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(albumImg), fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: TextStyle(
                    color: white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Divider(
                color: Colors.black,
                height: 10,
                thickness: 4,
                indent: 10,
                endIndent: 0,
              ),
              FollowPerson()
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            caption,
            style: TextStyle(color: white),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.music_note,
                color: white,
                size: 15,
              ),
              Flexible(
                child: Text(
                  songName,
                  style: TextStyle(color: white, height: 1.5),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
