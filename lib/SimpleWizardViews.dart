import 'package:flutter/material.dart';
import 'SimpleWizard.dart';
import 'SimpleWizardModels.dart';

class SimpleWizardQuestionView extends StatefulWidget {
  SimpleWizardQuestionView({
    required this.step,
    required this.instance,
    Key? key,
  }) : super(key: key);

  final SimpleWizardState instance;
  final ModelSimpleWizardStepQuestion step;

  @override
  State<SimpleWizardQuestionView> createState() =>
      _SimpleWizardQuestionViewState();
}

class _SimpleWizardQuestionViewState extends State<SimpleWizardQuestionView> {
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
                widget.step.text,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            ...widget.step.answers.map((ModelSimpleWizardStepAnswer answer) {
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
                    if (!widget.step.isMult) {
                      if (answer.skipToStep != null) {
                        widget.instance.goTo(answer.skipToStep!);
                      } else {
                        widget.instance.next();
                      }
                    } else {
                      setState(() {
                        answer.isSelected = !answer.isSelected;
                      });
                    }
                  },
                ),
              );
            }),
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
            child: Visibility(
              visible: widget.instance.showBack,
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
                  widget.instance.back();
                },
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
            child: Visibility(
              visible: widget.step.isMult,
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
                child: const Text("Next"),
                onPressed: () {
                  if (widget.step.isMult) {
                    if (widget.step.answers
                            .where((x) {
                              return x.isSelected;
                            })
                            .toList()
                            .length >=
                        widget.step.multiMinimum) {
                      widget.instance.next();
                    } else {
                      widget.instance.showError("You need to select at least " +
                          widget.step.multiMinimum.toString());
                    }
                  } else {
                    widget.instance.next();
                  }
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
