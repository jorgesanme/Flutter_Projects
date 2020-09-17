import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/painting.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // de define el sonido que se reproduce
  // recibe int X parametro desde el botón
  void playSound(int soundNumber) {
    final player = AudioCache(); //crea el reproductor de sonido
    player.play('note$soundNumber.wav'); //El sonido es según el boton pulsado
  }

  // se crea un instancia de un botón ( Patron singelton)
  Expanded buildKey(int soundNumber, {MaterialColor color}) {
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 0.2, horizontal: 0),
        child: Ink(
          decoration: new BoxDecoration(
            gradient: LinearGradient(colors: [
              color[200],
              color,
            ], stops: [
              0.4,
              0.6,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        ),
//        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white70,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(1, color: Colors.brown),
                buildKey(2, color: Colors.deepOrange),
                buildKey(3, color: Colors.amber),
                buildKey(4, color: Colors.green),
                buildKey(5, color: Colors.teal),
                buildKey(6, color: Colors.blue),
                buildKey(7, color: Colors.deepPurple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
