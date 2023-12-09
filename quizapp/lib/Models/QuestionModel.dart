class QuestionModel {
  QuestionModel({
    required this.status,
    required this.questions,
  });
  late final int status;
  late final List<Questions> questions;

  QuestionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    questions =
        List.from(json['Questions']).map((e) => Questions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['Questions'] = questions.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Questions {
  Questions({
    required this.id,
    required this.categoryId,
    required this.subcategoryId,
    required this.question,
    required this.solutionDescription,
    required this.difficulty,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int categoryId;
  late final int subcategoryId;
  late final String question;
  late final String solutionDescription;
  late final String difficulty;
  late final String createdAt;
  late final String updatedAt;

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    question = json['question'];
    solutionDescription = json['solution_description'];
    difficulty = json['difficulty'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_id'] = categoryId;
    _data['subcategory_id'] = subcategoryId;
    _data['question'] = question;
    _data['solution_description'] = solutionDescription;
    _data['difficulty'] = difficulty;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
