import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sherpa_app/Pages/HomePage.dart';
import 'package:sherpa_app/Pages/MenuPage.dart';
import 'package:sherpa_app/Pages/ProfilePage.dart';
import 'package:sherpa_app/Pages/ProgressPage.dart';
import 'package:sherpa_app/Pages/ExplorePage.dart';
import 'package:sherpa_app/Pages/ChallengesPage.dart';
import 'package:sherpa_app/Pages/screens.dart';
import 'package:sherpa_app/main.dart';


class CustomWidgetExample extends StatefulWidget {
  final BuildContext menuScreenContext;
  CustomWidgetExample({Key key, this.menuScreenContext}) : super(key: key);

  @override
  _CustomWidgetExampleState createState() => _CustomWidgetExampleState();
}

class _CustomWidgetExampleState extends State<CustomWidgetExample> {
  PersistentTabController _controller;
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [

      HomePage(
        hideStatus:_hideNavBar,
      ),
      ExplorePage(),
      ProgressPage(),
      ChallengesPage(),
      ProfilePage(
        hideStatus:_hideNavBar,
      ),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,

      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Search"),
        activeColor: Colors.teal,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add),
        title: ("Add"),
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColor: Colors.indigo,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColor: Colors.indigo,
        inactiveColor: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              TextButton(child:Text('hey'), onPressed: () {
                pushNewScreenWithRouteSettings(
                context,
                settings: RouteSettings(name:'/home'),
                screen: MenuPage());
              }

      ),


             // const Text('This is the Drawer');
            ],
          ),
        ),
      ),
      appBar: AppBar
        (
          actions:[


            /*IconButton(iconSize: 150,icon: Image.asset("assets/SHERPA.png", color: Colors.black,height: 1000,width: 1000,), onPressed: ()
            {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            pushNewScreen(
              context,
              screen: MainScreen2(),
            );
            }),*/

            ButtonTheme(
              //minWidth: 10.0,
              //height: 100.0,
              child: TextButton(

                onPressed: () {
                  pushNewScreenWithRouteSettings(
                    context,
                    settings: RouteSettings(name:'/home'),
                      screen: ProfilePage(hideStatus:_hideNavBar,),
                  );
                  /*pushNewScreen(
                    context,
                    screen: ProfilePage(),*/

                },
                child: Text("test"),
              ),
            ),
          ]
      ),

      body: PersistentTabView.custom(
        context,
        controller: _controller,
        screens: _buildScreens(),
        confineInSafeArea: true,
        itemCount: 5,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        hideNavigationBar: _hideNavBar,
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        customWidget: CustomNavBarWidget(
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
            });
          },
          selectedIndex: _controller.index,
        ),
      ),
    );
  }

}
