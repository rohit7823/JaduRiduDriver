class QuestionOption {
  String id;
  String option;

  QuestionOption({required this.id, required this.option});

  factory QuestionOption.fromJson(Map<String, dynamic> json) => QuestionOption(
    id: json["id"],
    option: json["option"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "option": option,
  };
}
