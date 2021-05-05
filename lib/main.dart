import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sherpa_app/provider/todos.dart';

import 'package:sherpa_app/services/auth.dart';
import 'package:sherpa_app/models/user.dart';
import 'package:sherpa_app/widget/wrapper.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

BuildContext? testContext;

class MyApp extends StatelessWidget {
  static final String title = 'Todo App With Firebase';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<UserData?>.value(
          initialData: null,
          value: AuthService().user,
        ),
        ChangeNotifierProvider(
          create: (context) => TodosProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        )
      ],
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

/*child: MaterialApp(
debugShowCheckedModeBanner: false,
title: title,
theme: ThemeData(
primarySwatch: Colors.pink,
scaffoldBackgroundColor: Color(0xFFf6f5ee),
),
home: Wrapper(),
),*/