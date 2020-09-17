import 'package:flutter/material.dart';

// se define un botón flotante propio
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 1.0,
      constraints: BoxConstraints.tightFor(
        width: 54.0,
        height: 54.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
