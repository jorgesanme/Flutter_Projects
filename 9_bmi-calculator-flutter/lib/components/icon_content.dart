import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class SexSelectorIcon extends StatelessWidget {
  SexSelectorIcon({this.sexIcon, this.sexText});
  final String sexText;
  final IconData sexIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          sexIcon,
          size: 60,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          sexText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
