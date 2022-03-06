import 'package:flutter/material.dart';
import 'package:simple_wizard/SimpleWizard.dart';

import 'models/answer.dart';
import 'models/answertypes/multichoice.dart';
import 'models/answertypes/range.dart';
import 'models/answertypes/singlechoice.dart';
import 'models/steps/finish.dart';
import 'models/steps/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleWizard Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SimpleWizard Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SimpleWizard(
        steps: [
          Question(
            id: "question_1",
            text: "Question 1",
            type: SingleChoiceAnswer(
              choices: [
                Answer(text: "This"),
                Answer(text: "That"),
                Answer(
                  text: "Skip to 3",
                  skipToStep: "question_3",
                ),
              ],
            ),
          ),
          Question(
            id: "question_2",
            text: "Question 2",
            type: MultipleChoiceAnswer(
              multiMinimum: 2,
              choices: [
                Answer(text: "This"),
                Answer(text: "That"),
              ],
            ),
          ),
          Question(
            id: "question_3",
            text: "Question 3",
            type: SingleChoiceAnswer(
              choices: [
                Answer(text: "This"),
                Answer(text: "That"),
                Answer(text: "Other"),
              ],
            ),
          ),
          Question(
            id: "question_4",
            text: "Question 4",
            type: RangeAnswer(),
          ),
          Finish(
            id: "finish",
          )
        ],
        onComplete: () {
          print("Done");
        },
      ),
    );
  }
}
