import "question.dart";

class Quizbrain {
  // the main purpose of this class is to abstract our quiz app logic away
  List<Question> questionLists = [
    Question('Messi is fron Argentina', true),
    Question('Ronaldo is from venezuela', false),
    Question(
        'In order for you to survive in the wide you have to be very smart.',
        false),
    Question('Some random question that i cannot think of right now.', true)
  ];
}
