import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          title: Text('Pulsa el Dado'),
          centerTitle: true,
          backgroundColor: Colors.black12,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int firstDiceNumber = 1;
  int secondDiceNumber = 2;
  int thirdDiceNumber = 3;
  void tirada() {
    setState(() {
      final player = AudioCache();
      player.play('lanzaDados.wav');
      firstDiceNumber = Random().nextInt(6) + 1;
      secondDiceNumber = Random().nextInt(6) + 1;
      thirdDiceNumber = Random().nextInt(6) + 1;
      print('#---------Inicio--------#');
      print('dado primero= $firstDiceNumber');
      print('dado segundo= $secondDiceNumber');
      print('dado tercero= $thirdDiceNumber');
      print('#-----------Fin---------#');
      print(' ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1, // proporciona un % de tamaño
            child: FlatButton(
              onPressed: () {
                tirada();
              },
              child: Image.asset('images/dice$firstDiceNumber.png'),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                tirada();
              },
              child: Image.asset('images/dice$secondDiceNumber.png'),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                tirada();
              },
              child: Image.asset('images/dice$thirdDiceNumber.png'),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }
}
