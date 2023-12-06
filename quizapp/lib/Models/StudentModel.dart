class StrudentModel {
  int? status;
  Student? student;
  String? token;
  String? message;

  StrudentModel({this.status, this.student, this.token, this.message});

  StrudentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    data['token'] = this.token;
    data['message'] = this.message;
    return data;
  }
}

class Student {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  Student(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.phoneNumber,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  Student.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['password'] = this.password;
    data['phone_number'] = this.phoneNumber;
    data['Image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
