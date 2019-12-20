import 'package:flutter/material.dart';
import 'package:quizzler/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  List<Widget> listWidget = [];
  Questions questions = Questions();
  int correctAnswers = 0;

  QuizBrain() {
    questions.addQuestion(
        'You can lead a cow down stairs but not up stairs.', false);
    questions.addQuestion(
        'Approximately one quarter of human bones are in the feet.', true);
    questions.addQuestion('A slug\s blood is green.', true);
    questions.addQuestion(
        'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true);
    questions.addQuestion(
        'It is illegal to pee in the Ocean in Portugal.', true);
    questions.addQuestion(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false);
    questions.addQuestion(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true);
    questions.addQuestion(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false);
    questions.addQuestion(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true);
    questions.addQuestion('Google was originally called \"Backrub\".', true);
    questions.addQuestion(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true);
    questions.addQuestion(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true);
  }

  void resetWidget() {
    listWidget = [];
    correctAnswers = 0;
  }

  String getCurrentQuestion() {
    return questions.getCurrentQuestion();
  }

  void submitAnswer(bool userAnswer, BuildContext context) {
    if (questions.checkCorrect(userAnswer)) {
      this.addCorrect();
      correctAnswers++;
    } else {
      this.addWrong();
    }
    if (questions.nextQuestion() == 0) {
      int numQuestions = questions.getNumQuestions();

      Alert(
        context: context,
        title: "Congrats!",
        desc:
            "You've done your quizzes! You've got $correctAnswers over $numQuestions corrected!",
        image: Image.asset("assets/correct.png"),
      ).show();
      questions.resetQuestion();
      this.resetWidget();
    }
  }

  void addCorrect() {
    listWidget.add(Icon(Icons.check, color: Colors.green));
  }

  void addWrong() {
    listWidget.add(Icon(Icons.close, color: Colors.red));
  }
}
