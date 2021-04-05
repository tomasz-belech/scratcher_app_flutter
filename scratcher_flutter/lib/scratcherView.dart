
import 'package:scratcher_flutter/appBody.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ScratcherView extends StatelessWidget {
  static String routeName = '/scratcherView';

  var data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print('Test: ${data['email']}');

    return MaterialApp(
      home: Scaffold(
        body: AppBody(email: data['email']),
      ),
    );
  }
}

