import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sherpa_app/shared/loading.dart';


class HabitPage extends StatefulWidget {

  HabitPage({this.info});
  final String? info;

  @override
  _HabitPageState createState() => _HabitPageState();
}


class _HabitPageState extends State<HabitPage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('HabitList')
              .where('title', isEqualTo: '${widget.info}')
              .snapshots(),
          builder: (context, snapshot)
          {
            if(!snapshot.hasData) return Loading();
            return MaterialApp(
                home: DefaultTabController(
                    length: 4,
                    child: Scaffold(
                        appBar: AppBar(
                          centerTitle: false,
                          elevation: 0,
                          backgroundColor: Colors.white,
                          toolbarHeight: 70,
                          title: Transform(transform: Matrix4.translationValues(10, -4.9, 0),child: Text('${widget.info}', style: TextStyle(color: Colors.black),)),
                          automaticallyImplyLeading: false,
                          bottom: TabBar(
                            indicator: BoxDecoration(border: Border(right: BorderSide(color: Colors.black), left: BorderSide(color: Colors.black))),

                            indicatorColor: Colors.white,
                            tabs: [
                              Tab(child: Text('MYHABIT',style: TextStyle(fontSize: 9.2, fontFamily: "Montserrat", color: Colors.black))),
                              Tab(child: Text('NEWSFEED',style: TextStyle(fontSize: 9.2, fontFamily: "Montserrat",color: Colors.black))),
                              Tab(child: Text('CHALLENGES',style: TextStyle(fontSize: 9.2, fontFamily: "Montserrat",color: Colors.black))),
                              Tab(child: Text('RESEARCH',style: TextStyle(fontSize: 9.2, fontFamily: "Montserrat",color: Colors.black))),
                            ],
                          ),
                        ),
                        body: TabBarView(
                          children:
                          [
                            //MYHABIT SCREEN
                            Center(child: Scaffold(
                              body: Column(
                                children: [
                                  Text((snapshot.data! as QuerySnapshot).docs[0]['title'])
                                ],
                              ),
                            )),
                            //NEWSFEED SCREEN
                            Center(child: Scaffold(
                              body: Column(
                                children: [
                                  Text((snapshot.data! as QuerySnapshot).docs[0]['feed'])
                                ],
                              ),
                            )),
                            //CHALLENGES SCREEN
                            Center(child: Scaffold(
                              body: Column(
                                children: [
                                  Text((snapshot.data! as QuerySnapshot).docs[0]['title'])
                                ],
                              ),
                            )),
                            //RESEARCH SCREEn
                            SingleChildScrollView(
                                child: Stack(
                                    children: <Widget>[
                                      new Container(

                                      ),
                                      new Padding(
                                        padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                                        child: Column(
                                          children: [
                                            Text((snapshot.data! as QuerySnapshot).docs[0]['research']),
                                            SizedBox(height: 100,),
                                          ],
                                        )


                                      )

                                    ],

                                )),
                          ],
                        )

                    )
                )
            );
          }
      )
    );


}
}

