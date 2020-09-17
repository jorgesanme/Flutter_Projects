import 'package:flutter/material.dart';

import 'screen1.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                color: Colors.blue,
                child: Text('Go Back To Screen 1'),
                onPressed: () {
                  Navigator.pushNamed(context, '/first');
                }
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (context) {
//                  return Screen1();
//                },
//              ),
//            );
//          },
                ),
            RaisedButton(
                color: Colors.blue,
                child: Text(' To Screen 0'),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                }
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (context) {
//                  return Screen1();
//                },
//              ),
//            );
//          },
                ),
          ],
        ),
      ),
    );
  }
}
