import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class ProfilePage extends StatefulWidget {
  final bool hideStatus;
  const ProfilePage({this.hideStatus});
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
