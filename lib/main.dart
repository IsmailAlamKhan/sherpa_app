import 'package:flutter/material.dart';
import 'package:sherpa_app/Widgets/wrapper.dart';
import 'package:sherpa_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sherpa_app/providers/habit_provider.dart';
import 'package:sherpa_app/providers/entry_provider.dart';
import 'package:sherpa_app/providers/test_provider.dart';
import 'package:sherpa_app/services/auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

BuildContext testContext;



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<NUser>.value(
          value: AuthService().user,
        ),
        ChangeNotifierProvider<ConstantHabitProvider>(
          create: (context) => ConstantHabitProvider(),
        ),
        InheritedProvider(
          create: (context) => TestProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EntryProvider(),
        )

      ],
      child: MaterialApp(
        home:Wrapper(),
      ),
          );

  }
}



/*class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<NUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Persistent Bottom Navigation Bar example project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:Wrapper(),
      ),
    );
  }
}*/

