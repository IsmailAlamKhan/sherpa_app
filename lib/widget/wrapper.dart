import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:sherpa_app/Pages/home_page.dart';
import 'package:sherpa_app/Pages/ProfilePage.dart';
import 'package:sherpa_app/Pages/ProgressPage.dart';
import 'package:sherpa_app/Pages/ExplorePage.dart';
import 'package:sherpa_app/Pages/ChallengesPage.dart';
import 'package:sherpa_app/main.dart';

import 'package:sherpa_app/authenticate/authenticate.dart';
import 'package:sherpa_app/services/auth.dart';
import 'package:sherpa_app/models/user.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Wrapper extends StatefulWidget {
  final BuildContext? menuScreenContext;
  Wrapper({Key? key, this.menuScreenContext}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final AuthService _auth = AuthService();
  PersistentTabController? _controller;
  bool? _hideNavBar;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      ExplorePage(),
      ProgressPage(),
      ChallengesPage(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {},
        ),
        icon: Icon(Icons.home),
        title: "Feed",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Explore"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add),
        title: ("Progress"),
        activeColorPrimary: Colors.deepOrange,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Challenges"),
        activeColorPrimary: Colors.indigo,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Profile"),
        activeColorPrimary: Colors.indigo,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Scaffold(
        drawer: Drawer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    child: Text('hey'),
                    onPressed: () {
                      pushNewScreenWithRouteSettings(context,
                          settings: RouteSettings(name: '/home'),
                          screen: HomePage());
                    }),
                ElevatedButton.icon(
                  onPressed: _auth.signOut,
                  icon: Icon(Icons.person),
                  label: Text('Logout'),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                iconSize: 150,
                icon: Image.asset(
                  "assets/SHERPA.png",
                  color: Colors.black,
                  height: 1000,
                  width: 1000,
                ),
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                  //Navigator.of(context).pushReplacementNamed('Profile');
                }),
            ButtonTheme(
              minWidth: 200.0,
              height: 100.0,
              child: TextButton(
                onPressed: () {},
                child: Text("                   "),
              ),
            ),
          ],
        ),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          hideNavigationBarWhenKeyboardShows: true,
          popActionScreens: PopActionScreensType.once,
          bottomScreenMargin: 0.0,

          selectedTabScreenContext: (context) {
            testContext = context;
          },
          hideNavigationBar: _hideNavBar,
          decoration: NavBarDecoration(
            colorBehindNavBar: Colors.blue,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle:
              NavBarStyle.style6, // Choose the nav bar style with this property
        ),
      );
    }
  }
}

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              iconSize: 150,
              icon: Image.asset(
                "assets/SHERPA.png",
                color: Colors.black,
                height: 1000,
                width: 1000,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          SizedBox(width: 1.0),
          /* ButtonTheme(
            minWidth: 100.0,
            height: 100.0,
            child: TextButton(
              onPressed: () {},
              child: Text("     4444    "),
            ),
          ),*/
        ],
      ),
    );
  }
}
