import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sherpa_app/models/Trip.dart';
import 'package:sherpa_app/Pages/HabitPage.dart';
import 'package:sherpa_app/services/auth.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    final newTrip = new Trip(null, null, null, null, null);

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewTripLocationView(trip: newTrip)));
          }, child: Text('ADD NEW TRIP', style: TextStyle(color: Colors.black),))
        ],
      ),
    body: Container(
      child: StreamBuilder(
          stream: getUsersTripsStreamSnapshots(context),
          builder: (context, snapshot) {
            if(!snapshot.hasData) return const Text("Loading...");
            return new ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildTripCard(context, snapshot.data.docs[index]));
          }
      ),

    ));
  }
  Stream<QuerySnapshot> getUsersTripsStreamSnapshots(BuildContext context) async* {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final uid = user.uid;

    yield* db.collection('userData').doc(uid).collection('trips').snapshots();
  }


  Widget buildTripCard(BuildContext context, DocumentSnapshot trip) {
    return new Container(
      child: Card(

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(trip['title']),
                //TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HabitPage(info: '${habit.name}')));}, child: Text('${habit.name}'),),
                //SizedBox(),
                Text('Future stuff'),
              ],
            ),
            Row(
              children: [
                IconButton(icon: Icon(Icons.access_alarm_rounded), onPressed: null),
                IconButton(icon: Icon(Icons.access_alarm_rounded), onPressed: null),
                IconButton(icon: Icon(Icons.access_alarm_rounded), onPressed: null),
                IconButton(icon: Icon(Icons.access_alarm_rounded), onPressed: null),
                IconButton(icon: Icon(Icons.access_alarm_rounded), onPressed: null),
                IconButton(icon: Icon(Icons.access_alarm_rounded), onPressed: null)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewTripLocationView extends StatelessWidget {
  final Trip trip;
  NewTripLocationView({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = new TextEditingController();
    _titleController.text = trip.title;

    return Scaffold(
        appBar: AppBar(
          title: Text('Create Trip - Location'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Enter a Location"),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextField(
                    controller: _titleController,
                    //autofocus: true,
                  ),
                ),
                RaisedButton(
                  child: Text("Continue"),
                  onPressed: () {
                    trip.title = _titleController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewTripBudgetView(trip: trip)),
                    );
                  },
                ),
              ],
            )
        )
    );
  }
}

class NewTripBudgetView extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final Trip trip;
  NewTripBudgetView({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = auth.currentUser;
    final uid = user.uid;

    return Scaffold(

        appBar: AppBar(
          title: Text('Create Trip - Budget'),
        ),
        body: Center(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text("Finish"),
                Text("Location ${trip.title}"),
                Text("Start Date 12/12/2020"),
                Text("End Date 12/20/2020"),

                RaisedButton(
                  child: Text("Finish"),

                  onPressed: () async {
                    // save data to fiebase
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final User user = auth.currentUser;
                    final uid = user.uid;

                    await db.collection("userData").doc(uid).collection("trips").add(trip.toJson());
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
              ],
            )
        )
    );
  }
}


