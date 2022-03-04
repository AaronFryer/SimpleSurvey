import 'package:flutter/material.dart';
import 'SimpleWizard.dart';
import 'SimpleWizardModels.dart';

class SimpleWizardQuestionView extends StatelessWidget {
  SimpleWizardQuestionView({
    required this.step,
    required this.instance,
    Key? key,
  }) : super(key: key);

  final SimpleWizardState instance;
  final ModelSimpleWizardStepQuestion step;

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
            ...step.answers.map((ModelSimpleWizardStepAnswer answer) {
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
                    instance.controller.animateToPage(
                      ++instance.currentPage,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease,
                    );
                  },
                ),
              );
            }),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Visibility(
              visible: instance.showBack,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  side: const BorderSide(
                    color: Colors.blue,
                  ),
                  minimumSize: const Size(75, 50),
                  maximumSize: const Size(75, 50),
                ),
                child: const Text("Back"),
                onPressed: () {
                  instance.controller.animateToPage(
                    --instance.currentPage,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SimpleWizardFinishView extends StatelessWidget {
  SimpleWizardFinishView({
    required this.step,
    required this.instance,
    Key? key,
  }) : super(key: key);

  final SimpleWizardState instance;
  final ModelSimpleWizardFinish step;

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
                instance.currentPage = 0;

                instance.controller.animateToPage(
                  instance.currentPage,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}