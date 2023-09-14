import 'package:quiz_flutter/types/question.dart';

class QuizBrain {
  int _questionIndex = 0;
  final List<Question> _questions = [
    Question(
      text: 'Alguns gatos são alérgicos a humanos',
      answer: true,
    ),
    Question(
      text:
          'É possível fazer com que uma vaca suba escadas, mas não descê-las.',
      answer: false,
    ),
    Question(
      text: 'Aproximadamente um quarto dos ossos humanos estão nos pés.',
      answer: true,
    ),
    Question(
      text: 'O sangue de uma lesma é verde.',
      answer: true,
    ),
    Question(
      text: 'O nome de solteira da mãe de Buzz Aldrin era "Moon".',
      answer: true,
    ),
    Question(
      text: 'É ilegal urinar no oceano, em Portugal.',
      answer: true,
    ),
    Question(
      text:
          'Nenhum pedaço quadrado de papel pode ser dobrado mais do que 7 vezes.',
      answer: false,
    ),
    Question(
      text:
          'Em Londres, se você morrer no Parlamento, você tem direito a um funeral de estado, porque o prédio é considerado um local sagrado.',
      answer: true,
    ),
    Question(
      text:
          'O som mais forte produzido por qualquer animal é de 188dB. Esse animal é o elefante africano.',
      answer: false,
    ),
    Question(
      text:
          'A área total dos dois pulmões de um humano é de aproximadamente 70 metros quadrados.',
      answer: true,
    ),
    Question(
      text: 'Google foi chamado, originalmente de "Backrub".',
      answer: true,
    ),
    Question(
      text:
          'O chocolate afeta o coração e o sistema nervoso de um cão; algumas gramas são suficientes para matar um cão pequeno.',
      answer: true,
    ),
    Question(
      text:
          'Na Virginia do Oeste, EUA, se você atropelar um animal com um carro, por acidente, você pode levá-lo para casa e comê-lo.',
      answer: true,
    ),
  ];

  String getQuestionText() {
    return getQuestion(_questionIndex).text;
  }

  bool getQuestionAnswer() {
    return getQuestion(_questionIndex).answer;
  }

  bool isCorrectAnswer(bool givenValue) {
    return givenValue == getQuestionAnswer();
  }

  Question getQuestion(int questionIndex) {
    return _questions[questionIndex];
  }

  void setQuestionIndex(int questionIndex) {
    _questionIndex = questionIndex;
  }

  void nextQuestion() {
    if (_questionIndex < _questions.length - 1) {
      _questionIndex++;
    }
  }

  bool isFinished() {
    return _questionIndex == _questions.length - 1;
  }

  void reset() {
    _questionIndex = 0;
  }
}
