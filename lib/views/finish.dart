import 'package:flutter/material.dart';

import '../SimpleWizard.dart';
import '../models/steps/finish.dart';

class SimpleWizardFinishView extends StatelessWidget {
  SimpleWizardFinishView({
    required this.step,
    required this.instance,
    Key? key,
  }) : super(key: key);

  final SimpleWizardState instance;
  final Finish step;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                step.text,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                instance.data.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                side: const BorderSide(
                  color: Colors.blue,
                ),
                minimumSize: const Size(75, 50),
                maximumSize: const Size(75, 50),
              ),
              child: const Text("Close"),
              onPressed: () {
                instance.goTo("question_1");
                instance.previousSteps.clear();
              },
            ),
          ],
        ),
      ],
    );
  }
}
