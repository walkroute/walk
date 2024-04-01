import 'package:flutter/material.dart';

class ScoreCalculator {
  static int calculateScore(Map<String, dynamic> event) {
    int score = 0;
    score += event['distance'] as int;
    score += (event['time'] as int) ~/ 60; // 예: 시간을 분으로 나눠 점수 계산
    score += (event['photoCount'] as int) * 2;
    if (event['questCompleted'] as bool) {
      score += 20;
    }
    return score;
  }

  static Color getColorForScore(int score) {
    if (score < 50) return Colors.red;
    else if (score < 100) return Colors.orange;
    else if (score < 150) return Colors.yellow;
    else return Colors.green;
  }
}
