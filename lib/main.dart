import 'package:flutter/material.dart';
import 'package:quiz_flutter/screens/quiz_page.dart';

void main() {
  runApp(const Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}
