import 'package:flutter/material.dart';
import 'package:simple_wizard/SimpleWizard.dart';

import 'SimpleWizardModels.dart';

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
      body: SimpleWizard(steps: [
        ModelSimpleWizardStepQuestion(
          id: "question_1",
          text: "Question 1",
          answers: [
            ModelSimpleWizardStepAnswer(text: "This"),
            ModelSimpleWizardStepAnswer(text: "That"),
            ModelSimpleWizardStepAnswer(
              text: "Skip to 3",
              skipToStep: "question_3",
            ),
          ],
        ),
        ModelSimpleWizardStepQuestion(
          id: "question_2",
          text: "Question 2",
          isMult: true,
          answers: [
            ModelSimpleWizardStepAnswer(text: "This"),
            ModelSimpleWizardStepAnswer(text: "That"),
          ],
        ),
        ModelSimpleWizardStepQuestion(
          id: "question_3",
          text: "Question 3",
          answers: [
            ModelSimpleWizardStepAnswer(text: "This"),
            ModelSimpleWizardStepAnswer(text: "That"),
          ],
        ),
        ModelSimpleWizardStepQuestion(
          id: "question_4",
          text: "Question 4",
          answers: [
            ModelSimpleWizardStepAnswer(text: "This"),
            ModelSimpleWizardStepAnswer(text: "That"),
          ],
        ),
        ModelSimpleWizardStepQuestion(
          id: "question_5",
          text: "Question 5",
          answers: [
            ModelSimpleWizardStepAnswer(text: "This"),
            ModelSimpleWizardStepAnswer(text: "That"),
          ],
        ),
        ModelSimpleWizardStepQuestion(
          id: "question_6",
          text: "Question 6",
          answers: [
            ModelSimpleWizardStepAnswer(text: "This"),
            ModelSimpleWizardStepAnswer(text: "That"),
          ],
        ),
        ModelSimpleWizardFinish(
          id: "finish",
        )
      ]),
    );
  }
}
