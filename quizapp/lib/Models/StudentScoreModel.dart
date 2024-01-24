class StudentScoreModel {
  StudentScoreModel({
    required this.status,
    required this.data,
  });
  late final int status;
  late final List<Data> data;

  StudentScoreModel.fromJson(Map<String, dynamic> json) {
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
    required this.studentId,
    required this.broadcastScore,
    required this.points,
    required this.rank,
    required this.student,
  });
  late final int studentId;
  late final int broadcastScore;
  late final int points;
  late final int? rank;
  late final Student student;

  Data.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    broadcastScore = json['broadcast_score'];
    points = json['points'];
    rank = json['rank'];
    student = Student.fromJson(json['student']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['student_id'] = studentId;
    _data['broadcast_score'] = broadcastScore;
    _data['points'] = points;
    _data['rank'] = rank;
    _data['student'] = student.toJson();
    return _data;
  }
}

class Student {
  Student({
    required this.id,
    required this.Name,
    required this.Email,
    required this.ImageUrl,
  });
  late final int id;
  late final String Name;
  late final String Email;
  late final String ImageUrl;

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Name = json['Name'];
    Email = json['Email'];
    ImageUrl = json['Image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['Name'] = Name;
    _data['Email'] = Email;
    _data['Image_url'] = ImageUrl;
    return _data;
  }
}
