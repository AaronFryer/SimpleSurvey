import 'package:flutter/widgets.dart';

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

  void Next() {
    if (currentPage < widget.steps.length - 1) {
      previousSteps.add(currentPage);
      currentPage++;
      _goToPage(currentPage);
    }
  }

  void Back() {
    if (previousSteps.isNotEmpty) {
      int previousPage = previousSteps.removeLast();
      currentPage = previousPage;
      _goToPage(currentPage);
    } else {
      //exit of out survey
    }
  }

  void GoTo(String step) {
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
  }

  @override
  void initState() {
    controller.addListener(() {
      // showBack = currentPage != widget.steps.length - 1; //no back on last page
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
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
    );
  }
}
