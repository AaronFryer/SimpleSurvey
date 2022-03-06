import 'package:flutter/material.dart';
import '../../SimpleWizard.dart';
import '../../models/answer.dart';
import '../../models/answertypes/multichoice.dart';
import '../../models/steps/question.dart';

class MultiChoice extends StatefulWidget {
  const MultiChoice({
    Key? key,
    required this.step,
    required this.instance,
  }) : super(key: key);

  final Question step;
  final SimpleWizardState instance;

  @override
  State<MultiChoice> createState() => _MultiChoiceState();
}

class _MultiChoiceState extends State<MultiChoice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...(widget.step.type as MultipleChoiceAnswer)
            .choices
            .map((Answer answer) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: answer.isSelected ? Colors.blue : Colors.white,
                onPrimary: answer.isSelected ? Colors.white : Colors.blue,
                side: const BorderSide(
                  color: Colors.blue,
                ),
                minimumSize: const Size(300, 50),
                maximumSize: const Size(300, 50),
              ),
              child: Text(answer.text),
              onPressed: () {
                setState(() {
                  answer.isSelected = !answer.isSelected;
                });
              },
            ),
          );
        })
      ],
    );
  }
}
