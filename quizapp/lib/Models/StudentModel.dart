class StudentModel {
  int? status;
  List<Students>? students;

  StudentModel({this.status, this.students});

  StudentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  Students(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.phoneNumber,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    email = json['Email'];
    password = json['password'];
    phoneNumber = json['phone_number'];
    imageUrl = json['Image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Name'] = name;
    data['Email'] = email;
    data['password'] = password;
    data['phone_number'] = phoneNumber;
    data['Image_url'] = imageUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
