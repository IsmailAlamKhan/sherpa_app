import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sherpa_app/services/firebase_api.dart';
import 'package:sherpa_app/models/todo.dart';
import 'package:sherpa_app/models/user.dart';
import 'package:sherpa_app/provider/todos.dart';
import 'package:sherpa_app/widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream<List<Todo>>? stream;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData?>(context);
    if (stream == null) {
      stream = FirebaseApi(uid: user?.uid).readTodos();
    }

    final tabs = [
      TodoListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Sherpa habits test'),
      ),

      //SIIN ON ASJAD VAJA YMBER TEHA JA LIHTSAMAKS (NO MORE BOTTOM TAB BAR)
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed',
          ),
        ],
      ),
      body: StreamBuilder<List<Todo>>(
        stream: stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText(snapshot.error.toString());
              } else {
                final todos = snapshot.data;

                final provider = Provider.of<TodosProvider>(context);
                provider.setTodos(todos);
                print(todos);
                return tabs[selectedIndex];
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
