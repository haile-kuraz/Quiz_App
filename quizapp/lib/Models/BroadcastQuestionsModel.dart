class BroadcastQuestionsModel {
  BroadcastQuestionsModel({
    required this.status,
    required this.data,
  });
  late final int status;
  late final List<Data> data;

  BroadcastQuestionsModel.fromJson(Map<String, dynamic> json) {
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
    required this.Question,
    required this.description,
    required this.dateofLive,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
    required this.broadcastOptions,
  });
  late final int id;
  late final String Question;
  late final String description;
  late final String dateofLive;
  late final String startTime;
  late final String endTime;
  late final String createdAt;
  late final String updatedAt;
  late final List<BroadcastOptions> broadcastOptions;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Question = json['Question'];
    description = json['description'];
    dateofLive = json['dateofLive'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    broadcastOptions = List.from(json['broadcast_options'])
        .map((e) => BroadcastOptions.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['Question'] = Question;
    _data['description'] = description;
    _data['dateofLive'] = dateofLive;
    _data['start_time'] = startTime;
    _data['end_time'] = endTime;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['broadcast_options'] =
        broadcastOptions.map((e) => e.toJson()).toList();
    return _data;
  }
}

class BroadcastOptions {
  BroadcastOptions({
    required this.id,
    required this.QuestionId,
    required this.code,
    required this.OptionValue,
    required this.IsCorrect,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int QuestionId;
  late final String code;
  late final String OptionValue;
  late final int IsCorrect;
  late final String createdAt;
  late final String updatedAt;

  BroadcastOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    QuestionId = json['Question_id'];
    code = json['code'];
    OptionValue = json['Option_value'];
    IsCorrect = json['Is_correct'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['Question_id'] = QuestionId;
    _data['code'] = code;
    _data['Option_value'] = OptionValue;
    _data['Is_correct'] = IsCorrect;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
