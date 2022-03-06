import 'package:flutter/material.dart';
import '../../simple_survey.dart';
import '../../models/steps/base.dart';

class TextChoice extends StatefulWidget {
  final SimpleSurveyState instance;
  final ModelSimpleSurveyStep step;

  const TextChoice({
    required this.instance,
    required this.step,
    Key? key,
  }) : super(key: key);

  @override
  State<TextChoice> createState() => _TextChoiceState();
}

class _TextChoiceState extends State<TextChoice> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 10,
      value: value,
      onChanged: (double v) {
        setState(() {
          value = v;
          widget.instance.setData(widget.step.id, v.toString());
        });
      },
    );
  }
}
