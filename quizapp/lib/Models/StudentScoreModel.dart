class StudentScoreModel {
  StudentScoreModel({
    required this.status,
    required this.data,
  });

  final int? status;
  final List<Datum> data;

  factory StudentScoreModel.fromJson(Map<String, dynamic> json) {
    return StudentScoreModel(
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.studentId,
    required this.broadcastScore,
    required this.points,
    required this.createdAt,
    required this.updatedAt,
    required this.student,
  });

  final int? id;
  final int? studentId;
  final double? broadcastScore;
  final double? points;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Student? student;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      studentId: json["student_id"],
      broadcastScore: json["broadcast_score"],
      points: json["points"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      student:
          json["student"] == null ? null : Student.fromJson(json["student"]),
    );
  }
}

class Student {
  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json["id"],
      name: json["Name"],
      email: json["Email"],
      password: json["password"],
      phoneNumber: json["phone_number"],
      imageUrl: json["Image_url"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}
