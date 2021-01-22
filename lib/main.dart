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
import 'package:sherpa_app/Widgets/BottomNavigationBar';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  /*FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);*/
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context)
  {
    MyBottomNavigationBar();
   // MyStatelessWidget();
      /*SystemChrome.setSystemUIOverlayStyle
      (
          SystemUiOverlayStyle
          (
          systemNavigationBarColor: Colors.pink,
          statusBarColor: Colors.amber, //Status bar color
          )
      );*/
      //FlutterStatusbarcolor.setStatusBarColor(Colors.blue); //this change the status bar color to white
      //FlutterStatusbarcolor.setNavigationBarColor(Colors.green); //this sets the navigation bar color to green
    return new MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
        home:MyStatelessWidget()

       // MyBottomNavigationBar(),
       // MyStatelessWidget(),
        );
  }
}
//BOTTOM NAVIGATION BAR START


//APPBAR START

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Next page'),
        ),
        body: const Center(
          child: Text(
            'This is the next page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
//APPBAR END
