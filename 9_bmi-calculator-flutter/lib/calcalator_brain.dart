import 'dart:math';

import 'package:bmi_calculator/screens/Input_page.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  final Gender gender;
  double _bmi;

  CalculatorBrain({this.height, this.weight, this.gender});

  String calculateBMI() {
    _bmi =
        weight / pow(height / 100, 2); // potencia de altura en cm/ 100 = metros
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return gender == Gender.male
          ? 'Afloja un poco con las papa y las arepas'
          : 'Niña deja el cocholate de lado';
    } else if (_bmi > 18) {
      return gender == Gender.male
          ? 'Muy bien machote, esta en buena forma'
          : 'Estas de muy buen ver mi niña ';
    } else {
      return gender == Gender.male
          ? 'Esmirriaooo!... un poco más de gófio con leche en el desayuno te vendría bien'
          : 'Flacucha!! a nadie le gusta los sacos de huesos';
    }
  }
}
