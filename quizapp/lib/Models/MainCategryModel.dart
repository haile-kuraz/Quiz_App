class MainCategoryModel {
  MainCategoryModel({
    required this.status,
    required this.categories,
  });
  late final int status;
  late final List<Categories> categories;

  MainCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    categories = List.from(json['categories'])
        .map((e) => Categories.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['categories'] = categories.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Categories {
  Categories({
    required this.id,
    required this.name,
    required this.imageUrl, // Change from ImageUrl to imageUrl
    required this.description,
    required this.categoryType,
    required this.updatedAt,
    required this.normalQuestions,
  });
  late final int id;
  late final String name;
  late final String imageUrl; // Change from ImageUrl to imageUrl
  late final String description;
  late final String categoryType;
  late final String updatedAt;
  late final List<NormalQuestion> normalQuestions; // Added field

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['Image_url'];
    description = json['description'];
    categoryType = json['categoryType'];
    updatedAt = json['updated_at'];
    normalQuestions = List.from(json['normal_questions'])
        .map((e) => NormalQuestion.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['Image_url'] = imageUrl;
    _data['description'] = description;
    _data['categoryType'] = categoryType;
    _data['updated_at'] = updatedAt;
    _data['normal_questions'] = normalQuestions.map((e) => e.toJson()).toList();
    return _data;
  }
}

class NormalQuestion {
  NormalQuestion({
    required this.id,
    required this.categoryId,
    required this.question,
  });
  late final int id;
  late final int categoryId;
  late final String question;

  NormalQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_id'] = categoryId;
    _data['question'] = question;
    return _data;
  }
}
