import 'package:TikTokUI/pages/root_app.dart';
import 'package:TikTokUI/screens/splash.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
    theme: ThemeData(
      primaryColor: Colors.white,
    ),
  ));
}
