import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionsNumber = 0;

  List<Question> _questions = [
    Question('¿Es el teide el pico más alto de Europa?', false),
    Question('¿Jorge esta gordo?', false),
    Question('¿El Carnaval de Tenerife es el mejor del mundo?', false),
    Question('¿Merece la pena vivir en Las Palmas?', false),
    Question('¿Es el mar la cuna de la vida?', true),
  ];
  // getter
  String getQuestionText() {
    return _questions[_questionsNumber].questionText;
  }

  bool getQuestionAnswer(int questionsNumber) {
    return _questions[_questionsNumber].questionAnswer;
  }

  void isFinished() {
    if (_questionsNumber < _questions.length - 1) {
      _questionsNumber++;
    } else {
      reset();
    }
  }

  int getQuestionNumbre() {
    return _questionsNumber;
  }

  int getQuestionLength() {
    return _questions.length;
  }

  void reset() {
    _questionsNumber = 0;
  }
}
