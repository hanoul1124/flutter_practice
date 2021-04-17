import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizController controller = QuizController();
  List<Widget> scoreKeeper = [];
  int count = 0;

  void checkAnswer(bool userAnswer) {
    bool realAnswer = controller.getCorrectAnswer();

    setState(() {
      if (controller.isFinished()) {
        Alert(
            context: context,
            title: "Quiz Finished!",
            desc: "Your Score is $count.",
            buttons: [
              DialogButton(
                  child: Text('End the Quiz'),
                  onPressed: () {
                    setState(() {
                      controller.initialize();
                      scoreKeeper = [];
                      count = 0;
                    });
                    Navigator.pop(context);
                  })
            ]).show();
      }

      if (userAnswer == realAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        count++;
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              controller.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(true);
                  controller.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                  controller.nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
