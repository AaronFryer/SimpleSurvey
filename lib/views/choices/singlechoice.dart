import 'package:flutter/material.dart';
import '../../SimpleWizard.dart';
import '../../models/answer.dart';
import '../../models/answertypes/singlechoice.dart';
import '../../models/steps/question.dart';

class SingleChoice extends StatelessWidget {
  const SingleChoice({
    Key? key,
    required this.step,
    required this.instance,
  }) : super(key: key);

  final Question step;
  final SimpleWizardState instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...(step.type as SingleChoiceAnswer).choices.map((Answer answer) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                side: const BorderSide(
                  color: Colors.blue,
                ),
                minimumSize: const Size(300, 50),
                maximumSize: const Size(300, 50),
              ),
              child: Text(answer.text),
              onPressed: () {
                instance.setData(step.id, answer.text);

                if (answer.skipToStep != null) {
                  instance.goTo(answer.skipToStep!);
                } else {
                  instance.next();
                }
              },
            ),
          );
        })
      ],
    );
  }
}
