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
    final data = <String, dynamic>{};
    data['status'] = status;
    data['Score'] = score.toJson();
    return data;
  }
}

class Score {
  Score({
    required this.broadcastScore,
    required this.points,
    required this.rank,
  });
  late final int broadcastScore;
  late final int points;
  late final int? rank;

  Score.fromJson(Map<String, dynamic> json) {
    broadcastScore = json['broadcast_score'];
    points = json['points'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['broadcast_score'] = broadcastScore;
    data['points'] = points;
    data['rank'] = rank;
    return data;
  }
}
