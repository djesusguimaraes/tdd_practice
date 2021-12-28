import 'dart:convert';

class Team {
  final int players;
  final String? name;
  final int score;

  Team({
    this.score = 0,
    this.name,
    this.players = 6,
  });

  Map<String, dynamic> toMap() {
    return {
      'players': players,
      'name': name,
      'score': score,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      players: map['players']?.toInt() ?? 0,
      name: map['name'],
      score: map['score']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source));
}
