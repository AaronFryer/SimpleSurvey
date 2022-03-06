import '../answertypes/base.dart';
import 'base.dart';

class Question extends ModelSimpleSurveyStep {
  String text;
  String? subtext;
  AnswerType type;

  Question({
    required this.text,
    this.subtext,
    required this.type,
    required id,
  }) : super(id: id);
}
