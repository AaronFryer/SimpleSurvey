import 'package:flutter/material.dart';

import '../models/answertypes/multichoice.dart';
import '../models/answertypes/range.dart';
import '../models/answertypes/singlechoice.dart';
import '../models/steps/question.dart';
import '../simple_survey.dart';
import 'choices/multichoice.dart';
import 'choices/rangechoice.dart';
import 'choices/singlechoice.dart';
import 'choices/textchoice.dart';

class SimpleSurveyQuestionView extends StatefulWidget {
  const SimpleSurveyQuestionView({
    required this.step,
    required this.instance,
    Key? key,
  }) : super(key: key);

  final SimpleSurveyState instance;
  final Question step;

  @override
  State<SimpleSurveyQuestionView> createState() =>
      _SimpleSurveyQuestionViewState();
}

class _SimpleSurveyQuestionViewState extends State<SimpleSurveyQuestionView> {
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
            if (widget.step.type.runtimeType == SingleChoiceAnswer)
              SingleChoice(
                step: widget.step,
                instance: widget.instance,
              )
            else if (widget.step.type.runtimeType == MultipleChoiceAnswer)
              MultiChoice(
                step: widget.step,
                instance: widget.instance,
              )
            else if (widget.step.type.runtimeType == RangeAnswer)
              RangeChoice(
                instance: widget.instance,
                step: widget.step,
              )
            else if (widget.step.type.runtimeType == TextChoice)
              TextChoice(
                instance: widget.instance,
                step: widget.step,
              )
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
        btnNext(
          widget: widget,
        )
      ],
    );
  }
}

class btnNext extends StatelessWidget {
  const btnNext({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final SimpleSurveyQuestionView widget;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
        child: Visibility(
          visible: widget.step.type.runtimeType == MultipleChoiceAnswer ||
              widget.step.type.runtimeType == RangeAnswer,
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
              if (widget.step.type.runtimeType == MultipleChoiceAnswer) {
                if ((widget.step.type as MultipleChoiceAnswer)
                        .choices
                        .where((x) {
                          return x.isSelected;
                        })
                        .toList()
                        .length >=
                    (widget.step.type as MultipleChoiceAnswer).multiMinimum) {
                  widget.instance.setData(
                      widget.step.id,
                      (widget.step.type as MultipleChoiceAnswer)
                          .choices
                          .toString());
                  widget.instance.next();
                } else if (widget.step.type.runtimeType == RangeAnswer) {
                  widget.instance.next();
                } else {
                  widget.instance.showError("You need to select at least " +
                      (widget.step.type as MultipleChoiceAnswer)
                          .multiMinimum
                          .toString());
                }
              } else {
                widget.instance.next();
              }
            },
          ),
        ),
      ),
    );
  }
}
