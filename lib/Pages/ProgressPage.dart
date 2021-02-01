import 'package:flutter/material.dart';
import 'package:sherpa_app/Pages/HabitPage.dart';
import 'package:sherpa_app/Pages/ProfilePage.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
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
                title: Text("Home"),
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
            minWidth: 90.0,
            height: 100.0,
            child: TextButton(
              onPressed: () {},
              child: Text(""),
            ),
          ),


        ],
      ),
      body:Column(
        children: [
          const Text("Test"),
          ElevatedButton(
              child: Text("Running"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HabitPage(info: 'Running'))); // Passing the info as argument
              },
          ),
          ElevatedButton(
            child: Text("Cooking"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HabitPage(info: 'Cooking'))); // Passing the info as argument
            },
          ),

        ],
      )
    );
  }
}
