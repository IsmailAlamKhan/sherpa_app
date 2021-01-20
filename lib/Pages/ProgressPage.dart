import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar
        (
          title: new Text("Progress Page")
      ),
      body: new Center(
        child: new Text("This is Progress page"),
      ),
    );
  }
}
