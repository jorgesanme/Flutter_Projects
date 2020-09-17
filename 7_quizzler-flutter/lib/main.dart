import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:audioplayers/audio_cache.dart';

QuizBrain quizBrain = new QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int correctAnwersPoint = 0;
  int incorrectAnwersPoint = 0;
  int cont = quizBrain.getQuestionNumbre() + 1;
  double percent = 0.0;
  double step = 1 / quizBrain.getQuestionLength();
  final audioPlayer = AudioCache();
  void answer(bool userAnswer) {
    setState(() {
      bool correctAnswer =
          quizBrain.getQuestionAnswer(quizBrain.getQuestionNumbre());

      if (correctAnswer == userAnswer) {
        correctAnwersPoint++;
        audioPlayer.play('correct.wav');
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        incorrectAnwersPoint++;
        audioPlayer.play('error.wav');
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.redAccent,
          ),
        );
      }
      quizBrain.isFinished();
      percent = percent + step;

      if (quizBrain.getQuestionNumbre() == cont - 1) {
        Alert(
          context: context,
          title: "The End",
          desc: "Correct Answer: $correctAnwersPoint\n" +
              "Incorrect Answer: $incorrectAnwersPoint\n" +
              "  Press to restar",
          image: Image.asset('images/End.png'),
        ).show();

        scoreKeeper.clear();
        quizBrain.reset();
        correctAnwersPoint = 0;
        incorrectAnwersPoint = 0;
        percent = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int cont = quizBrain.getQuestionNumbre() + 1;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Center(
              child: new CircularPercentIndicator(
                radius: 100.0,
                animation: true,
                animationDuration: 95,
                lineWidth: 10.0,
                percent: percent,
                center: new Text(
                  cont.toString() +
                      '/' +
                      quizBrain.getQuestionLength().toString(),
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.white70,
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.white,
                progressColor: Colors.lightBlueAccent,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 29.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                answer(true); //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                answer(false); //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: , false,
question2: , true,
question3: , true,
*/

/*
Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.redAccent,
    ),
 */
