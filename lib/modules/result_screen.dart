import 'package:flutter/material.dart';
import 'package:quiz_app/modules/quiz_screen.dart';
import 'package:quiz_app/shared/components/components.dart';
import 'package:quiz_app/shared/components/constants.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key, required this.selectedAnswers, required this.userScore});

  List<String>? selectedAnswers;
  int? userScore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
      ),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered $userScore out of ${selectedAnswers!.length} questions correctly!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      defaultResult(context, index),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemCount: selectedAnswers!.length),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                navigateAndFinish(context, const QuezScreen());
              },
              label: const Text(
                "Restart Quiz",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget defaultResult(context, index) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.deepPurple.shade900,
            foregroundColor: Colors.white,
            child: Text((index + 1).toString()),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${quiz[index].questionText}",
                        style: const TextStyle(
                            color: Colors.white, height: 1.1, fontSize: 18),
                      ),
                    ),
                    selectedAnswers![index] == quiz[index].answers![0]
                        ? Icon(
                            Icons.check,
                            color: Colors.green.shade400,
                          )
                        : Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  selectedAnswers![index],
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  quiz[index].answers![0],
                  style:
                      const TextStyle(color: Colors.amberAccent, fontSize: 17),
                ),
              ],
            ),
          ),
        ],
      );
}
