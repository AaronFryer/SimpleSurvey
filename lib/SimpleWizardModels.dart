class ModelSimpleWizardStep {
  String id = "default_id";

  ModelSimpleWizardStep({required this.id});
}

class ModelSimpleWizardStepQuestion extends ModelSimpleWizardStep {
  String text = "This is the question?";
  List<ModelSimpleWizardStepAnswer> answers = [];
  bool isMult;

  ModelSimpleWizardStepQuestion({
    required this.text,
    required this.answers,
    this.isMult = false,
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
