import 'dart:convert';

import 'package:lage_score/app/global/entities/team.model.dart';

class Match {
  final DateTime? duration;
  final Team firstTeam;
  final Team secondTeam;

  Match({
    this.duration,
    required this.firstTeam,
    required this.secondTeam,
  });

  Map<String, dynamic> toMap() {
    return {
      'duration': duration?.millisecondsSinceEpoch,
      'firstTeam': firstTeam.toMap(),
      'secondTeam': secondTeam.toMap(),
    };
  }

  factory Match.fromMap(Map<String, dynamic> map) {
    return Match(
      duration: map['duration'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['duration'])
          : null,
      firstTeam: Team.fromMap(map['firstTeam']),
      secondTeam: Team.fromMap(map['secondTeam']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Match.fromJson(String source) => Match.fromMap(json.decode(source));
}
