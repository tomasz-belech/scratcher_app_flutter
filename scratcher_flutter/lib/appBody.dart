import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';
import 'package:scratcher_flutter/firebaseDatabase.dart';

class AppBody extends StatelessWidget {
  final String email;

  const AppBody({Key key, this.email}) : super(key: key);

  Future<void> scratchCardDialog(BuildContext context, bool won) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'Scratch Your Lottery Card',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            content: Scratcher(
              accuracy: ScratchAccuracy.low,
              brushSize: 50,
              child: Container(
                height: 300,
                width: 300,
                alignment: Alignment.center,
                child: Text(won ? 'You Won' : 'You lost',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.blue,
                    )),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide.none,
          ),
          color: Colors.blue,
          child: Text(
            'Get a ScratchCard',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          onPressed: () {
            var value = Random();
            var number = value.nextInt(100);
            bool won = number < 20;


            scratchCardDialog(context, won);
            DatabaseService().addUserData(email, won);
          },
        ));
  }
}
