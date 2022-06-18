import "package:flutter/material.dart";
import 'package:quizler/models/quizbrain.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: Quizzler(),
      ),
    );
  }
}

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  final quizbrain = Quizbrain();
  List<Icon> scoreKeeper = [];

  void checkAnser(bool userAnswer) {
    setState(
      () {
        if (quizbrain.checkIndex()) {
          if (quizbrain.checkAnswer(userAnswer)) {
            scoreKeeper.add(Icon(
              Icons.check,
              color: Colors.green,
            ));
          } else {
            scoreKeeper.add(Icon(Icons.close, color: Colors.red));
          }
          quizbrain.nextQuestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                quizbrain.getNextQuestion().questionText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    checkAnser(true);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text('True',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    checkAnser(false);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    child: Text(
                      'False',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: scoreKeeper,
            ),
          )
        ],
      ),
    );
  }
}
