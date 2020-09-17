import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/Input_page.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI calculated'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Your BMI:',
                  textAlign: TextAlign.center,
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: kbodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            bottonButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
