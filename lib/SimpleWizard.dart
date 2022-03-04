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
  bool showBack = false;

  @override
  void initState() {
    controller.addListener(() {
      showBack = currentPage != widget.steps.length - 1; //no back on last page
    });

    super.initState();
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
