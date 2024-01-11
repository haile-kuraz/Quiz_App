class CategoryPointModel {
  CategoryPointModel({
    required this.status,
    required this.data,
  });
  late final int status;
  late final List<Data> data;

  CategoryPointModel.fromJson(Map<String, dynamic> json) {
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
    required this.name,
    required this.ImageUrl,
    required this.description,
    required this.categoryType,
    required this.createdAt,
    required this.updatedAt,
    required this.point,
  });
  late final int id;
  late final String name;
  late final String ImageUrl;
  late final String description;
  late final String categoryType;
  late final String createdAt;
  late final String updatedAt;
  late final Point point;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ImageUrl = json['Image_url'];
    description = json['description'];
    categoryType = json['categoryType'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    point = Point.fromJson(json['point']);
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
    _data['point'] = point.toJson();
    return _data;
  }
}

class Point {
  Point({
    required this.id,
    required this.studentId,
    required this.categoryId,
    required this.point,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int studentId;
  late final int categoryId;
  late final int point;
  late final String createdAt;
  late final String updatedAt;

  Point.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    categoryId = json['category_id'];
    point = json['point'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['student_id'] = studentId;
    _data['category_id'] = categoryId;
    _data['point'] = point;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
