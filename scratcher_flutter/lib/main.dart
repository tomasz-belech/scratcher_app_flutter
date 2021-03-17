import 'package:flutter/material.dart';
import 'package:scratcher_flutter/scratcherView.dart';
import 'package:scratcher_flutter/homePage.dart';

void main() {
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
      },
    );
  }
}


