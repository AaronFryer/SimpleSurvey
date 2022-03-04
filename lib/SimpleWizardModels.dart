class ModelSimpleWizardStep {
  String id = "default_id";

  ModelSimpleWizardStep({required this.id});
}

class ModelSimpleWizardStepQuestion extends ModelSimpleWizardStep {
  String text = "This is the question?";
  List<ModelSimpleWizardStepAnswer> answers = [];
  bool isMult;
  int multiMinimum;

  ModelSimpleWizardStepQuestion({
    required this.text,
    required this.answers,
    this.isMult = false,
    this.multiMinimum = 1,
    required id,
  }) : super(id: id);
}

class ModelSimpleWizardFinish extends ModelSimpleWizardStep {
  String text = "This is the end";

  ModelSimpleWizardFinish({
    required id,
  }) : super(id: id);
}

class ModelSimpleWizardStepAnswer {
  String text = "Default Answer";
  String? skipToStep;
  bool isSelected = false;

  ModelSimpleWizardStepAnswer({
    required this.text,
    this.skipToStep,
  });
}
