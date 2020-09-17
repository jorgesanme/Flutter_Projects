import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyanAccent[100],
        appBar: AppBar(
          title: Text('¿Soy pobre?'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[700],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/poor.png'),
          ),
        ),
      ),
    ),
  );
}
