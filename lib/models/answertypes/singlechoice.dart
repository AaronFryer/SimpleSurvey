import '../answer.dart';
import 'base.dart';

class SingleChoiceAnswer extends AnswerType {
  List<Answer> choices;

  SingleChoiceAnswer({required this.choices});
}
