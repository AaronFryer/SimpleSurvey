import '../answer.dart';
import 'base.dart';

class MultipleChoiceAnswer extends AnswerType {
  List<Answer> choices;
  int multiMinimum;

  MultipleChoiceAnswer({
    required this.choices,
    this.multiMinimum = 1,
  });
}
