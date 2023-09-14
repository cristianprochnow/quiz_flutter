import 'package:flutter/material.dart';
import 'package:quiz_flutter/types/question.dart';
import 'package:quiz_flutter/widgets/correct_icon.dart';
import 'package:quiz_flutter/widgets/wrong_icon.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> score = [];
  List<Question> questions = [
    Question(
      text: "Você pode fazer uma vaca descer uma escada, mas não subir.",
      answer: false,
    ),
    Question(
      text: "Aproximadamente um quarto dos ossos humanos estão nos pés.",
      answer: true,
    ),
    Question(
      text: "O sangue de uma lesma é verde.",
      answer: true,
    )
  ];
  List<bool> answers = [false, true, true];
  int questionIndex = 0;

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
                questions[questionIndex].text,
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
  }

  void onPressedFalseButton() {
    changeQuestion();
  }

  void addScore(bool isCorrect) {
    Widget answerIcon = const CorrectIcon();

    if (!isCorrect) {
      answerIcon = const WrongIcon();
    }

    score.add(answerIcon);
  }

  void changeQuestion() {
    setState(() {
      if (questionIndex + 1 == questions.length) {
        questionIndex = 0;

        return;
      }

      questionIndex++;
    });
  }
}
