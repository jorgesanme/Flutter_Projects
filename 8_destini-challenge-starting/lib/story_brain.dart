import 'package:destini_challenge_starting/story.dart';

class StoryBrain {
  int _storyNumber = 0;
  List<Story> _storyData = [
    Story(
        storyTitle:
            'Estas en tu casa solo viendo la TV de noche. Repentinamente se produce un apagon y te quedas a oscuras',
        choice1: 'Ir a comprobar los fusibles',
        choice2: 'Coges el telefono para averiguar que ha pasado'),
    Story(
        storyTitle:
            'Observas que no tienes ningun tipo de conexion a Internet ni tampoco cobertura.',
        choice1: 'Activas la linterna de tu movil.',
        choice2:
            'Decides entretenerte con tu juego favorito en el movil, hasta que vuelva la electricidad'),
    Story(
        storyTitle:
            'Te acercas al cuadro electrico y lo observas minuciosamente...',
        choice1: 'Creyendote McGyver toqueteas todos los fusibles.',
        choice2: 'No comprendes nada. Decides irte a la cama a dormir'),
    Story(
        storyTitle:
            'MALAS NOTICIAS:\nLa electricidad NUNCA volvio. Te has quedado sin bateria en el movil y pierdes la cordura. Vagas por las calles buscado pilas usadas de Ikea',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'De camino tropiezas con una lata de cerveza olvidada, te caes y te das un golpe en la cabeza y duermes en el pasillo...\n para siempre.',
        choice1: 'Restart',
        choice2: '5 Aguantar'),
    Story(
        storyTitle:
            'En este momento vuelve la electricidad y te da una descarga que te deja inconsiente... \n para siempre.',
        choice1: 'Restart',
        choice2: '')
  ];

  StoryBrain();

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  int setStoryNumber(int value) {
    _storyNumber = value;
  }

  void restart() {
    _storyNumber = 0;
  }

  void nextStory(int userChoice) {
    if (_storyNumber == 0 && userChoice == 1) {
      setStoryNumber(2);
    } else if (_storyNumber == 0 && userChoice == 2) {
      setStoryNumber(1);
    } else if (_storyNumber == 1 && userChoice == 1) {
      setStoryNumber(2);
    } else if (_storyNumber == 1 && userChoice == 2) {
      setStoryNumber(3);
    } else if (_storyNumber == 2 && userChoice == 1) {
      setStoryNumber(5);
    } else if (_storyNumber == 2 && userChoice == 2) {
      setStoryNumber(4);
    } else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      restart();
    }
  }

  bool buttonShoulBeVisible() {
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2) {
      return true;
    } else {
      return false;
    }
  }
}
