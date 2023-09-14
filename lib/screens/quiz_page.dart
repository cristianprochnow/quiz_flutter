import 'package:flutter/material.dart';

import 'package:quiz_flutter/domain/quiz_brain.dart';
import 'package:quiz_flutter/widgets/correct_icon.dart';
import 'package:quiz_flutter/widgets/wrong_icon.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> score = [];
  int questionIndex = 0;
  QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              onPressed: onPressedTrueButton,
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              onPressed: onPressedFalseButton,
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Falso',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }

  void onPressedTrueButton() {
    changeQuestion();
    addScore(true);
  }

  void onPressedFalseButton() {
    changeQuestion();
    addScore(false);
  }

  void addScore(bool givenValue) {
    Widget answerIcon = const CorrectIcon();

    if (!quizBrain.isCorrectAnswer(givenValue)) {
      answerIcon = const WrongIcon();
    }

    if (!quizBrain.isFinished()) {
      score.add(answerIcon);
    }
  }

  void changeQuestion() {
    setState(() {
      quizBrain.nextQuestion();
    });
  }
}
