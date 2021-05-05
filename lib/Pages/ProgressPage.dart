import 'package:flutter/material.dart';
import 'package:sherpa_app/Pages/HabitPage.dart';

class ProgressPage extends StatefulWidget {
  @override

  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {

  @override
  void initState(){
    super.initState();

  }
  Widget build(BuildContext context) {
    //ADD HABBIT SETTINGS
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: Spacer(),
          //child: SettingsForm(),
        );
      });
    }


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Progress', style: (TextStyle(color: Colors.black)),),
          actions: [
            TextButton(
              child: Text('Add habit'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),


      body:Column(
        children: [
          ElevatedButton(
              child: Text("Running"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HabitPage(info: 'Gratitude Journal'))); // Passing the info as argument
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
class ResearchScreen extends StatelessWidget {
  const ResearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "habit",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
