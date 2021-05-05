import 'package:flutter/material.dart';



class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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