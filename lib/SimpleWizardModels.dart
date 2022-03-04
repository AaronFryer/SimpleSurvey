class ModelSimpleWizardStep {}

class ModelSimpleWizardStepQuestion extends ModelSimpleWizardStep {
  String text = "This is the question?";
  List<ModelSimpleWizardStepAnswer> answers = [];

  ModelSimpleWizardStepQuestion({
    required this.answers,
  });
}

class ModelSimpleWizardFinish extends ModelSimpleWizardStep {
  String text = "This is the end";

  // ModelSimpleWizardFinish({  });
}

class ModelSimpleWizardStepAnswer {
  String text = "ANSWER";

  ModelSimpleWizardStepAnswer({
    required this.text,
  });
}
