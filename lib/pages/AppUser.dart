import 'package:flutter/material.dart';

class AppUser extends StatefulWidget {
  @override
  _AppUserState createState() => _AppUserState();
}

class _AppUserState extends State<AppUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('Random App User Profile'),
        ));
  }
}
