class ScoreModel {
  ScoreModel({
    required this.status,
    required this.score,
  });
  late final int status;
  late final Score score;

  ScoreModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    score = Score.fromJson(json['Score']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['Score'] = score.toJson();
    return _data;
  }
}

class Score {
  Score({
    required this.broadcastScore,
    required this.points,
  });
  late final double broadcastScore;
  late final double points;

  Score.fromJson(Map<String, dynamic> json) {
    broadcastScore = json['broadcast_score'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['broadcast_score'] = broadcastScore;
    _data['points'] = points;
    return _data;
  }
}
