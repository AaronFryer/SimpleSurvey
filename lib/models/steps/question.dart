import '../answertypes/base.dart';
import 'base.dart';

class Question extends ModelSimpleSurveyStep {
  String text = "This is the question?";
  AnswerType type;

  Question({
    required this.text,
    required this.type,
    required id,
  }) : super(id: id);
}
