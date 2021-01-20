/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'dart:io';

import 'package:sherpa_app/Pages/ExplorePage.dart';
import 'package:sherpa_app/Pages/HomePage.dart';
import 'package:sherpa_app/Pages/ProfilePage.dart';
import 'package:sherpa_app/Pages/ProgressPage.dart';
import 'package:sherpa_app/Pages/ChallengesPage.dart';
import 'package:sherpa_app/Pages/TEST%20PAGE.dart';



void main()
{
  /*FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);*/

  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context)
  {
      /*SystemChrome.setSystemUIOverlayStyle
      (
          SystemUiOverlayStyle
          (
          systemNavigationBarColor: Colors.pink,
          statusBarColor: Colors.amber, //Status bar color
          )
      );*/
      FlutterStatusbarcolor.setStatusBarColor(Colors.blue); //this change the status bar color to white
      FlutterStatusbarcolor.setNavigationBarColor(Colors.green); //this sets the navigation bar color to green
    return new MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: MyBottomNavigationBar()
    );
  }
}





class MyBottomNavigationBar extends StatefulWidget
{
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}



class _MyBottomNavigationBarState extends State<MyBottomNavigationBar>
{
  int _currentIndex = 0;
  final List <Widget> _children =
  [
    HomePage(),
    ExplorePage(),
    ChallengesPage(),
    ProgressPage(),
    ProfilePage(),
  ];

  void onTappedBar(int index)
  {
    setState((){
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
      (
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar
      (

        onTap: onTappedBar,
        currentIndex: _currentIndex,

        items:
        [
          BottomNavigationBarItem
          (
              icon: new Icon(Icons.home),
              label: 'Feed'
          ),
          BottomNavigationBarItem
          (
              icon: new Icon(Icons.settings),
              label: 'Explore'
          ),
          BottomNavigationBarItem
            (
              icon: new Icon(Icons.contacts),
              label: 'Progress'
          ),
          BottomNavigationBarItem
            (
              icon: new Icon(Icons.contacts,
              color: Colors.blue.shade400),
              label: 'Challenges'
          ),
          BottomNavigationBarItem
            (
              icon: new Icon(Icons.contacts),
              label: 'Profile'
          ),
        ],
      ),
    );
  }
}


