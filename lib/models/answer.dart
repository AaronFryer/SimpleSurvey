class Answer {
  String text = "Default Answer";
  String? skipToStep;
  bool isSelected = false;

  @override
  String toString() {
    return text;
  }

  Answer({
    required this.text,
    this.skipToStep,
  });
}
