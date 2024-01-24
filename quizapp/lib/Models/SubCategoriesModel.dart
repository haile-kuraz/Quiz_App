class SubcategoriesModel {
  SubcategoriesModel({
    required this.status,
    required this.subcategory,
  });
  late final int status;
  late final List<Subcategory> subcategory;

  SubcategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    subcategory = List.from(json['Subcategory'])
        .map((e) => Subcategory.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['Subcategory'] = subcategory.map((e) => e.toJson()).toList();
    return data;
  }
}

class Subcategory {
  Subcategory({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.imageUrl, // Change from ImageUrl to imageUrl
    required this.updatedAt,
    required this.normalQuestions,
  });
  late final int id;
  late final int categoryId;
  late final String name;
  late final String imageUrl; // Change from ImageUrl to imageUrl
  late final String updatedAt;
  late final List<NormalQuestion> normalQuestions; // Added field

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    imageUrl = json['Image_url'];
    updatedAt = json['updated_at'];
    normalQuestions = List.from(json['normal_questions'])
        .map((e) => NormalQuestion.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['Image_url'] = imageUrl;
    data['updated_at'] = updatedAt;
    data['normal_questions'] = normalQuestions.map((e) => e.toJson()).toList();
    return data;
  }
}

class NormalQuestion {
  NormalQuestion({
    required this.id,
    required this.categoryId,
    required this.subcategoryId,
  });
  late final int id;
  late final int categoryId;
  late final int subcategoryId;

  NormalQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['subcategory_id'] = subcategoryId;
    return data;
  }
}
