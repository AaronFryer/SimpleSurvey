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
        ModelSimpleWizardStepQuestion(answers: [
          ModelSimpleWizardStepAnswer(text: "This"),
          ModelSimpleWizardStepAnswer(text: "That"),
          ModelSimpleWizardStepAnswer(text: "Other"),
        ]),
        ModelSimpleWizardStepQuestion(answers: [
          ModelSimpleWizardStepAnswer(text: "This"),
          ModelSimpleWizardStepAnswer(text: "That"),
        ]),
        ModelSimpleWizardStepQuestion(answers: [
          ModelSimpleWizardStepAnswer(text: "This"),
          ModelSimpleWizardStepAnswer(text: "That"),
        ]),
        ModelSimpleWizardFinish()
      ]),
    );
  }
}
