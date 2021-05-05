import 'package:flutter/material.dart';



class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar
        (
          title: new Text("Menu Page")
      ),
      body: new Center(
        child: new Text("This WILL BE MENU PAGE"),
      ),
    );
  }
}
