part of '../tennis_score_test.dart';

/// `TennisScenario` class is a model class that holds the player scores and the expected game score.
final class TennisScenario {
  final int firstPlayerScore;
  final int secondPlayerScore;
  final String expectedScore;

  const TennisScenario(
    this.firstPlayerScore,
    this.secondPlayerScore,
    this.expectedScore,
  );
}
