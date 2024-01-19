// class CategoryPointModel {
//   int? status;
//   List<Data>? data;

//   CategoryPointModel({this.status, this.data});

//   CategoryPointModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   String? imageUrl;
//   String? description;
//   String? categoryType;
//   String? createdAt;
//   String? updatedAt;
//   Point? point;

//   Data(
//       {this.id,
//       this.name,
//       this.imageUrl,
//       this.description,
//       this.categoryType,
//       this.createdAt,
//       this.updatedAt,
//       this.point});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     imageUrl = json['Image_url'];
//     description = json['description'];
//     categoryType = json['categoryType'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     point = json['point'] != null ? new Point.fromJson(json['point']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['Image_url'] = this.imageUrl;
//     data['description'] = this.description;
//     data['categoryType'] = this.categoryType;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.point != null) {
//       data['point'] = this.point!.toJson();
//     }
//     return data;
//   }
// }

// class Point {
//   int? id;
//   int? studentId;
//   int? categoryId;
//   int? point;
//   String? createdAt;
//   String? updatedAt;

//   Point(
//       {this.id,
//       this.studentId,
//       this.categoryId,
//       this.point,
//       this.createdAt,
//       this.updatedAt});

//   Point.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     studentId = json['student_id'];
//     categoryId = json['category_id'];
//     point = json['point'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['student_id'] = this.studentId;
//     data['category_id'] = this.categoryId;
//     data['point'] = this.point;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

class CategoryPointModel {
  int? status;
  List<Data>? data;

  CategoryPointModel({this.status, this.data});

  CategoryPointModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? imageUrl;
  String? description;
  String? categoryType;
  String? createdAt;
  String? updatedAt;
  Point? point;

  Data({
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.categoryType,
    this.createdAt,
    this.updatedAt,
    this.point,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['Image_url'];
    description = json['description'];
    categoryType = json['categoryType'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    point = json['point'] != null ? Point.fromJson(json['point']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['Image_url'] = imageUrl;
    data['description'] = description;
    data['categoryType'] = categoryType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (point != null) {
      data['point'] = point!.toJson();
    }
    return data;
  }
}

class Point {
  int? id;
  int? studentId;
  int? categoryId;
  int? point;
  String? createdAt;
  String? updatedAt;

  Point({
    this.id,
    this.studentId,
    this.categoryId,
    this.point,
    this.createdAt,
    this.updatedAt,
  });

  Point.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    categoryId = json['category_id'];
    point = json['point'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['student_id'] = studentId;
    data['category_id'] = categoryId;
    data['point'] = point;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
