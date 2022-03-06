library simple_survey;

import 'dart:async';

import 'package:flutter/material.dart';
import 'models/steps/base.dart';
import 'models/steps/finish.dart';
import 'models/steps/question.dart';
import 'views/finish.dart';
import 'views/question.dart';
export 'models/steps/question.dart';
export 'models/steps/finish.dart';
export 'models/answer.dart';
export 'models/answertypes/multichoice.dart';
export 'models/answertypes/range.dart';
export 'models/answertypes/singlechoice.dart';

class SimpleSurvey extends StatefulWidget {
  const SimpleSurvey({
    required this.steps,
    required this.onComplete,
    Key? key,
  }) : super(key: key);

  final List<ModelSimpleSurveyStep> steps;
  final VoidCallback onComplete;

  @override
  State<SimpleSurvey> createState() => SimpleSurveyState();
}

class SimpleSurveyState extends State<SimpleSurvey> {
  final PageController controller = PageController();

  int currentPage = 0;
  bool showBack = true;
  List<int> previousSteps = [];
  String? errorMessage;
  Timer? errorTimer;
  Map<String, String> data = {};

  void setData(key, value) {
    data[key] = value;
  }

  void showError(msg) {
    setState(() {
      errorMessage = msg;
    });

    errorTimer?.cancel();
    errorTimer = Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        errorMessage = null;
      });
    });
  }

  void next() {
    if (currentPage < widget.steps.length - 1) {
      previousSteps.add(currentPage);
      currentPage++;
      _goToPage(currentPage);
    }
  }

  void back() {
    if (previousSteps.isNotEmpty) {
      int previousPage = previousSteps.removeLast();
      currentPage = previousPage;
      _goToPage(currentPage);
    } else {
      //exit of out survey
    }
  }

  void goTo(String step) {
    int index = widget.steps.indexWhere((element) => element.id == step);
    previousSteps.add(currentPage);
    currentPage = index;
    _goToPage(currentPage);
  }

  void _goToPage(int pageIndex) {
    controller.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );

    showBack = currentPage > 0;

    if (widget.steps[currentPage].runtimeType == Finish) {
      widget.onComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: errorMessage != null,
          child: Positioned(
            top: 100,
            child: Container(
              padding: const EdgeInsets.fromLTRB(48, 24, 48, 24),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.red.shade300,
                  width: 1.5,
                ),
              ),
              child: Text(errorMessage ?? ''),
            ),
          ),
        ),
        PageView(
          reverse: false,
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: <Widget>[
            ...widget.steps.map((ModelSimpleSurveyStep step) {
              if (step.runtimeType == Question) {
                return SimpleSurveyQuestionView(
                  step: step as Question,
                  instance: this,
                );
              } else if (step.runtimeType == Finish) {
                return SimpleSurveyFinishView(
                  step: step as Finish,
                  instance: this,
                );
              } else {
                return Container();
              }
            })
          ],
        ),
      ],
    );
  }
}
