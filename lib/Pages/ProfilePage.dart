import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar
        (
          title: new Text("Profile Page")
      ),
      body: new Center(
        child: new Text("This is Profile page"),
      ),
    );
  }
}