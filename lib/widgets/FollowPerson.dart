import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowPerson extends StatefulWidget {
  @override
  _FollowPersonState createState() => _FollowPersonState();
}

class _FollowPersonState extends State<FollowPerson> {
  bool isfollow = false;
  _onFollow() {
    setState(() {
      isfollow = !isfollow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onFollow,
      child: Container(
        width: 80,
        height: 33,
        decoration: isfollow
            ? BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                border: Border.all(width: 2.0, color: Colors.white70),
                borderRadius: BorderRadius.circular(15))
            : BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(width: 2.0, color: Colors.black),
                borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text('Follow',
              style: GoogleFonts.pacifico(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                  textStyle: TextStyle(
                    color: Colors.white,
                  ))),
        ),
      ),
    );
  }
}
