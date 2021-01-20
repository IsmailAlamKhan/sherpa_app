import 'package:flutter/material.dart';



class ChallengesPage extends StatefulWidget {
  @override
  _ChallengesPageState createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar
        (
          title: new Text("Challenges Page")
      ),
      body: new Center(
        child: new Text("This is Challeneges page"),
      ),
    );
  }
}