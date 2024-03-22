import 'package:flutter/material.dart';
import 'package:quiz_app/modules/quiz_screen.dart';
import 'package:quiz_app/shared/components/components.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Image(
                image: AssetImage("assets/images/start.png"),
                width: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Learn Flutter the fun way!",
                style: TextStyle(fontSize: 20, color: Colors.grey[300]),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    navigateAndFinish(context, const QuezScreen());
                  },
                  icon:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  label: const Text(
                    "Start Quiz",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
