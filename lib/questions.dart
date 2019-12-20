import 'package:quizzler/question.dart';

class Questions {
  List<Question> listQuestions = [];
  int current = 0;

  Questions();

  String getCurrentQuestion() {
    return listQuestions[current].questionText;
  }

  int nextQuestion() {
    if (current < listQuestions.length - 1) {
      current++;
      return 1; // for not last
    } else if (current > listQuestions.length) {
      return -1; // for last
    }
    else{
      return 0; // for reset
    }
  }
  void resetQuestion(){
    this.current=0;
  }
  int getNumQuestions(){
    return listQuestions.length;
  }

  void addQuestion(String text, bool answer) {
    listQuestions.add(Question(text, answer));
  }

  bool checkCorrect(bool inputAnswer) {
    if (listQuestions[current].questionAnswer == inputAnswer) {
      return true;
    } else {
      return false;
    }
  }
}
