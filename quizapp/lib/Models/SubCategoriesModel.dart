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
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['Subcategory'] = subcategory.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Subcategory {
  Subcategory({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.ImageUrl,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final int categoryId;
  late final String ImageUrl;
  late final String createdAt;
  late final String updatedAt;

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    ImageUrl = json['Image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['category_id'] = categoryId;
    _data['Image_url'] = ImageUrl;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
