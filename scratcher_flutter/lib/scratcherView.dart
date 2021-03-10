import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class ScratcherView extends StatelessWidget {

  static String routeName = '/scratcherView';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  Future<void> scratchCardDialog(context) {
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
                 child: Text(
                   'You Won',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 50,
                     color: Colors.blue,
                   )
                 )

               )
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
          onPressed: () => scratchCardDialog(context),
        ));
  }
}
