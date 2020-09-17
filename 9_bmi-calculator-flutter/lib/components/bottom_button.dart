import 'package:flutter/material.dart';
import '../constants.dart';

class bottonButton extends StatelessWidget {
  bottonButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(buttonTitle, style: kLargeButtonTextStyle),
          ],
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.only(bottom: 5.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
