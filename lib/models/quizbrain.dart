import "question.dart";

class Quizbrain {
  // the main purpose of this class is to abstract our quiz app logic away
  List<Question> _questionLists = [
    Question('Messi is fron Argentina', true),
    Question('Ronaldo is from venezuela', false),
    Question(
        'In order for you to survive in the wide you have to be very smart.',
        false),
    Question('Some random question that i cannot think of right now.', true)
  ];

  int _quizIndex = 0;

  Question getNextQuestion() {
    return _questionLists[_quizIndex];
  }

  void nextQuestion() {
    if (_quizIndex < _questionLists.length - 1) {
      _quizIndex++;
    }
  }

  bool checkIndex() {
    return _quizIndex < _questionLists.length;
  }

  bool checkAnswer(bool userAnswer) {
    bool questionAsnwer = _questionLists[_quizIndex].questionAnswer;
    return questionAsnwer == userAnswer;
  }
}
