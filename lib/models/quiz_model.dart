class QuizModel {
  String? questionText;
  List<String>? answers;

  QuizModel({
    required this.questionText,
    required this.answers,
  });

  List<String> get shuffledAnswers {
    List<String> shuffled = List.of(answers!);
    shuffled.shuffle();
    return shuffled;
  }
}
