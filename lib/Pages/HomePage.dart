
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sherpa_app/Pages/Home.dart';
import 'package:sherpa_app/Pages/ProfilePage.dart';
import 'package:sherpa_app/Pages/ProgressPages/settings_form.dart';
import 'package:sherpa_app/services/auth.dart';
import 'package:sherpa_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:sherpa_app/Pages/ProgressPages/habit_list.dart';
import 'package:sherpa_app/models/habit.dart';
import 'package:sherpa_app/models/user.dart';



class HomePage extends StatefulWidget {
  final bool hideStatus;
  const HomePage({this.hideStatus});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  @override


  Widget build(BuildContext context) {
    final user = Provider.of<NUser>(context);

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Habit>>.value(
      value:DatabaseService().habits,
      child: Scaffold(

          body: Scaffold(

          appBar: AppBar(
            title: Text('Home page'),
            actions: [
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('Add habit'),
                onPressed: () => _showSettingsPanel(),
                )
              ],
            ),
          body: HabitList(),
        ),

    )
    );
  }
}

          /*actions: [
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
          ],*/



        /*bottomNavigationBar: BottomNavigationBar(
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
        ),*/
       // body: HabitList(),



