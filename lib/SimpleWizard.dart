import 'dart:async';

import 'package:flutter/material.dart';

import 'SimpleWizardModels.dart';
import 'SimpleWizardViews.dart';

class SimpleWizard extends StatefulWidget {
  const SimpleWizard({
    required this.steps,
    Key? key,
  }) : super(key: key);

  final List<ModelSimpleWizardStep> steps;

  @override
  State<SimpleWizard> createState() => SimpleWizardState();
}

class SimpleWizardState extends State<SimpleWizard> {
  final PageController controller = PageController();

  int currentPage = 0;
  bool showBack = true;
  List<int> previousSteps = [];
  String? errorMessage;
  Timer? errorTimer;

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
            ...widget.steps.map((ModelSimpleWizardStep step) {
              if (step.runtimeType == ModelSimpleWizardStepQuestion) {
                return SimpleWizardQuestionView(
                  step: step as ModelSimpleWizardStepQuestion,
                  instance: this,
                );
              } else if (step.runtimeType == ModelSimpleWizardFinish) {
                return SimpleWizardFinishView(
                  step: step as ModelSimpleWizardFinish,
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
