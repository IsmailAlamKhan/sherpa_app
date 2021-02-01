import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sherpa_app/Pages/ProfilePage.dart';
import 'package:sherpa_app/main.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  final bool hideStatus;
  const HomePage({this.hideStatus});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override


  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
              ListTile(
                title: Text("Home Page drawer"),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(

        actions: [
          IconButton(iconSize: 150,icon: Image.asset("assets/SHERPA.png", color: Colors.black,height: 1000,width: 1000,), onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          }),
        ButtonTheme(
          minWidth: 100.0,
          height: 100.0,
          child: TextButton(
            onPressed: () {},
            child: Text("     4444    "),
          ),
        ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.pinkAccent,
            icon: new Icon(Icons.home, color: Colors.black),
            label: 'Feed',
            //activeBackgroundColor: Colors.red, // this is the change
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pinkAccent,
            icon: new Icon(Icons.home, color: Colors.black),
            label: 'Feed',
            //activeBackgroundColor: Colors.red, // this is the change
          ),
        ],
      ),
      body: Column(
        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/7,
            color: Colors.blue,
            child: Center(child: Text("Challenges Page",style: TextStyle(fontSize: 41,color: Colors.white),),),
          ),
        ],
      ),
    );
  }
}
