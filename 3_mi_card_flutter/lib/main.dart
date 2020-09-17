import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//        backgroundColor: Colors.green[200],
        appBar: AppBar(
          title: Text('Tarjeta de Visita'),
          centerTitle: true,
          backgroundColor: Colors.green[300],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Center(
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('images/Weo.jpg'),
                ),
              ),
              Text(
                'Weomer Sánchez',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Vigilante de nevera',
                  style: TextStyle(
                    fontFamily: 'SansPro',
                    fontSize: 25.0,
                    color: Colors.teal.shade100,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 25.0,
                      color: Colors.teal[700],
                    ),
                    title: Text(
                      '+01 11011 01001',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'SansPro',
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  )),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      size: 25.0,
                      color: Colors.teal[700],
                    ),
                    title: Text(
                      'Cuidatunevera@gmail.com',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'SansPro',
                          fontSize: 18.0,
                          color: Colors.black),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

//
//Row(
//children: <Widget>[
//
//SizedBox(
//width: 20.0,
//),
//
//],
//),
