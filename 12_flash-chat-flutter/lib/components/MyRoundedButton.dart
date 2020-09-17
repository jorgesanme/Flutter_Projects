import 'package:flutter/material.dart';

class MyRoundedButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onPressed;
  final String heroTag;

  MyRoundedButton(
      {this.color,
      this.title,
      @required this.onPressed,
      @required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Hero(
        tag: heroTag,
        child: Material(
          elevation: 5.0,
          color: this.color,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200.0,
            height: 45.0,
            child: Text(
              this.title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
