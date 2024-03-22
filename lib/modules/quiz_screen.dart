import 'package:flutter/material.dart';
import 'package:quiz_app/modules/result_screen.dart';
import 'package:quiz_app/shared/components/components.dart';
import 'package:quiz_app/shared/components/constants.dart';

class QuezScreen extends StatefulWidget {
  const QuezScreen({super.key});

  @override
  State<QuezScreen> createState() => _QuezScreenState();
}

class _QuezScreenState extends State<QuezScreen> {
  var currentIndex = 0;
  int score = 0;
  List<String> usersAnswers = [];

  calcScore() {
    if (usersAnswers[currentIndex] == quiz[currentIndex].answers![0]) {
      score++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.deepPurpleAccent],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomCenter,
        )),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "${quiz[currentIndex].questionText}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(height: 30),
            ...quiz[currentIndex]
                .shuffledAnswers
                .map((answerText) => defaultAnswersButton(context, answerText)),
          ],
        ),
      ),
    );
  }

  Widget defaultAnswersButton(context, answerText) => Container(
        margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
        child: ElevatedButton(
          onPressed: () {
            usersAnswers.add(answerText);
            setState(() {
              calcScore();
              if (currentIndex == quiz.length - 1) {
                navigateAndFinish(
                    context,
                    ResultScreen(
                        selectedAnswers: usersAnswers, userScore: score));
              } else {
                currentIndex++;
              }
            });
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple.shade900,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: const TextStyle(fontSize: 18),
          ),
          child: Text(
            answerText,
            textAlign: TextAlign.center,
          ),
        ),
      );
}
