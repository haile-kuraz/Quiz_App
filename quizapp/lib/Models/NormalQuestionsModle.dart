class QuestionModel {
  QuestionModel({
    required this.status,
    required this.data,
  });
  late final int status;
  late final List<Data> data;

  QuestionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.categoryId,
    required this.subcategoryId,
    required this.question,
    required this.solutionDescription,
    required this.difficulty,
    required this.createdAt,
    required this.updatedAt,
    required this.options,
  });
  late final int id;
  late final int categoryId;
  late final int subcategoryId;
  late final String question;
  late final String solutionDescription;
  late final String difficulty;
  late final String createdAt;
  late final String updatedAt;
  late final List<Options> options;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    question = json['question'];
    solutionDescription = json['solution_description'];
    difficulty = json['difficulty'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    options =
        List.from(json['options']).map((e) => Options.fromJson(e)).toList();
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
    _data['options'] = options.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Options {
  Options({
    required this.id,
    required this.QuestionId,
    required this.code,
    required this.OptionValue,
    required this.IsCorrect,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int QuestionId;
  late final String code;
  late final String OptionValue;
  late final int IsCorrect;
  late final String createdAt;
  late final String updatedAt;

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    QuestionId = json['Question_id'];
    code = json['code'];
    OptionValue = json['Option_value'];
    IsCorrect = json['Is_correct'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['Question_id'] = QuestionId;
    _data['code'] = code;
    _data['Option_value'] = OptionValue;
    _data['Is_correct'] = IsCorrect;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
