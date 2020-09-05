import 'package:flutter/material.dart';

class BuildMoreOption extends StatefulWidget {
  String text = '';
  BuildMoreOption(this.text);
  @override
  _BuildMoreOptionState createState() => _BuildMoreOptionState();
}

class _BuildMoreOptionState extends State<BuildMoreOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.text),
      ),
    );
  }
}
