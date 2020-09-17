import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/painting.dart';

void main() => runApp(
      MaterialApp(
        home: Ball(),
      ),
    );

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  void moveAleatory() {
    setState(() {
      int oldNumbre = ballNumber;
      ballNumber = Random().nextInt(5) + 1;
      if (oldNumbre == ballNumber) {
        ballNumber = Random().nextInt(5) + 1;
      }
      print('nº de imagen: $ballNumber');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Hazme una pregunta'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.indigoAccent,
                Colors.blue[900],
                Colors.white70,
              ],
              stops: [
                0.1,
                0.3,
                0.5
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),
        ),
        child: Center(
          child: FlatButton(
            onPressed: () {
              moveAleatory();
            },
            child: Image.asset('images/ball$ballNumber.png'),
          ),
        ),
      ),
    );
  }
}
