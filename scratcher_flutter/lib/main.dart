import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scratcher_flutter/scratcherView.dart';
import 'package:scratcher_flutter/homePage.dart';
import 'package:scratcher_flutter/logIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        ScratcherView.routeName: (context) => ScratcherView(),
        LogIn.routeName: (context) => LogIn(),
      },
    );
  }
}
