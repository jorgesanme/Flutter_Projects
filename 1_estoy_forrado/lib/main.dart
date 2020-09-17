import 'package:flutter/material.dart';

// The main function is the satring point for all our Flutter apps.
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Estoy Forrado'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/diamante.png'),
          ),
        ),
      ),
    ),
  );
}
//Center(
//child: Text('que pasa ahora'),
//),
