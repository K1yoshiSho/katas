part of '../tennis_score_test.dart';

/// Function `_checkAllScenarios`
///
/// This function checks all scores in a tennis game based on different game scenarios.
/// The function takes two parameters:
/// - `@game` - A TennisGame object where points can be added for players.
/// - `@testScenario` - A testing scenario including player scores and the expected game score.
void _checkAllScenarios({
  required TennisGame game,
  required TennisScenario testScenario,
}) {
  final highestScore =
      max(testScenario.firstPlayerScore, testScenario.secondPlayerScore);

  for (int i = 0; i < highestScore; i++) {
    if (i < testScenario.firstPlayerScore) {
      game.addPoint(player: PlayerEnum.first);
    }
    if (i < testScenario.secondPlayerScore) {
      game.addPoint(player: PlayerEnum.second);
    }
  }

  expect(game.getScore(), testScenario.expectedScore);
}
