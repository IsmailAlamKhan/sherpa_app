import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:sherpa_app/Pages/HomePage.dart';
import 'package:sherpa_app/Pages/ChallengesPage.dart';
import 'package:sherpa_app/Pages/ExplorePage.dart';
import 'package:sherpa_app/Pages/HabitPage.dart';
import 'package:sherpa_app/Pages/MenuPage.dart';
import 'package:sherpa_app/Pages/ProfilePage.dart';
import 'package:sherpa_app/Pages/ProgressPage.dart';
import 'package:sherpa_app/Pages/screens.dart';
import 'package:sherpa_app/authenticate/authenticate.dart';
import 'package:sherpa_app/models/user.dart';
import 'package:sherpa_app/services/auth.dart';
import 'Widgets/custom-widget-tabs.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

import 'Pages/screens.dart';

void main() => runApp(MyApp());

BuildContext testContext;

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<NUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Persistent Bottom Navigation Bar example project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:HomePage(),
        initialRoute: '/',

      ),
    );
  }
}
// ----------------------------------------- Main menu (Login screen)----------------------------------------- //
class MainMenu extends StatefulWidget {
  MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future login screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ElevatedButton(
              child: Text("Login"),
              onPressed: () {

               pushNewScreen(
                context,
                screen: CustomWidgetExample(

                )
              );
              },
            ),
          ),
          SizedBox(height: 20.0),

        ],
      ),
    );
  }
}
// ----------------------------------------- Custom Style ----------------------------------------- //

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    Key key,
    this.selectedIndex,
    @required this.items,
    this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeColorAlternate == null
                      ? item.activeColor
                      : item.activeColorAlternate)
                      : item.inactiveColor == null
                      ? item.activeColor
                      : item.inactiveColor),
              child: item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                    item.title,
                    style: TextStyle(
                        color: isSelected
                            ? (item.activeColorAlternate == null
                            ? item.activeColor
                            : item.activeColorAlternate)
                            : item.inactiveColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0),
                  )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
