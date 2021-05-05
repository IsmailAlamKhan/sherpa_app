
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final bool? hideStatus;
  const HomePage({this.hideStatus});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
    /*final user = Provider.of<UserData>(context);

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Habit>>.value(
      value:OurDatabase(uid: user.uid).habits,
      child: Scaffold(

          body: Scaffold(

          appBar: AppBar(
            title: Text('Home page'),
            actions: [
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('Add habit'),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsForm())),
                //onPressed: () => _showSettingsPanel(),
                ),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('Update'),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateHabit())),
              )
              ],
            ),
          body: HabitList(),
        ),

    )
    );*/
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





/*class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar
        (
          title: new Text("Challenges Page")
      ),
      body: new Center(
        child: new Text("This is Challeneges page"),
      ),
    );
  }
}*/