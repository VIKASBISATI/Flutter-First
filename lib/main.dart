import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var _questionIndex = 0;

    final questions = const [
      {
        'questiontext': "Whats your favourite color",
        'answers': ['Green', "Blue", "Yellow", "Red"]
      },
      {
        'questiontext': "Whats your favourite Sport",
        'answers': ['Cricket', "BMT", "Racing", "Swimming"]
      },
      {
        'questiontext': "Whats your favourite Laptop",
        'answers': ['Apple', "MI", "SMSNG", "JIO"]
      },
    ];

    void _answerQuestion() {
      if (_questionIndex < questions.length - 1) {
        print(questions.length);
        setState(() {
          _questionIndex = _questionIndex + 1;
        });
        print(_questionIndex);
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My First App")),
        body: _questionIndex < questions.length
            ? Column(children: [
                Question(
                  questions[_questionIndex]['questiontext'],
                ),
                ...(questions[_questionIndex]['answers'] as List<String>)
                    .map((answer) {
                  return Answer(_answerQuestion, answer);
                }).toList()
              ])
            : Center(child: Text("You did it!")),
      ),
    );
  }
}
