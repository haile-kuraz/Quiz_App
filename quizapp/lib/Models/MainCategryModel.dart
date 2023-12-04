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
    required this.ImageUrl,
    required this.description,
    required this.categoryType,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String ImageUrl;
  late final String description;
  late final String categoryType;
  late final String createdAt;
  late final String updatedAt;

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ImageUrl = json['Image_url'];
    description = json['description'];
    categoryType = json['categoryType'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['Image_url'] = ImageUrl;
    _data['description'] = description;
    _data['categoryType'] = categoryType;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
