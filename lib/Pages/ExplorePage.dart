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
          title: new Text("Explore Page")
      ),
      body: new Center(
        child: new Text("This is Explore page"),
      ),
    );
  }
}
