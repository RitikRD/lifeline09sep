import 'dart:io';

import 'package:TikTokUI/pages/home_page.dart';
import 'package:TikTokUI/theme/colors.dart';
import 'package:TikTokUI/widgets/actiontoolbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  // int pageIndex = 0;

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Do you want to exit the app'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => {Navigator.pop(context, false)},
                    child: Text('No')),
                FlatButton(
                    onPressed: () => {
                          //Navigator.pop(context, true)
                          exit(0)
                        },
                    child: Text('Yes'))
              ],
            ));
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
