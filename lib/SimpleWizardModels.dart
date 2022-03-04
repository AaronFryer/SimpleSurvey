class ModelSimpleWizardStep {
  String id = "default_id";

  ModelSimpleWizardStep({required this.id});
}

class ModelSimpleWizardStepQuestion extends ModelSimpleWizardStep {
  String text = "This is the question?";
  AnswerType answers;

  ModelSimpleWizardStepQuestion({
    required this.text,
    required this.answers,
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
  String? skipToStep;
  ModelSimpleWizardStepAnswer({
    this.skipToStep,
  });
}

class ModelSimpleWizardStepAnswerButton extends ModelSimpleWizardStepAnswer {
  String text = "Default Answer";

  bool isSelected = false;

  ModelSimpleWizardStepAnswerButton({
    required this.text,
    skipToStep,
  }) : super(skipToStep: skipToStep);
}

class ModelSimpleWizardStepAnswerRange extends ModelSimpleWizardStepAnswer {
  ModelSimpleWizardStepAnswerRange({
    skipToStep,
  }) : super(skipToStep: skipToStep);
}

class AnswerType {}

class SingleChoiceAnswer extends AnswerType {
  List<ModelSimpleWizardStepAnswerButton> choices;

  SingleChoiceAnswer({required this.choices});
}

class MultipleChoiceAnswer extends AnswerType {
  List<ModelSimpleWizardStepAnswerButton> choices;
  int multiMinimum;

  MultipleChoiceAnswer({
    required this.choices,
    this.multiMinimum = 1,
  });
}
