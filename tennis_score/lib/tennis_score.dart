import 'package:tennis_score/base/tennis_game.dart';
import 'package:tennis_score/constant/all_scenarios.dart';
import 'package:tennis_score/constant/score.dart';
import 'package:tennis_score/enums/player.dart';

/// `TennisGame` class is used to simulate a tennis game.
class TennisGameImp implements TennisGame {
  int _firstPlayer = 0;

  int _secondPlayer = 0;

  /// ============`Getters`============

  int get firstPlayerScore => _firstPlayer;
  int get secondPlayerScore => _secondPlayer;

  /// ============`Methods`============

  @override
  void addPoint({
    required PlayerEnum player,
  }) {
    switch (player) {
      case PlayerEnum.first:
        _firstPlayer = _updateScore(_firstPlayer, _secondPlayer);
        break;
      case PlayerEnum.second:
        _secondPlayer = _updateScore(_secondPlayer, _firstPlayer);
        break;
    }
  }

  /// `getScore` method returns the current score of the game.
  @override
  String getScore() {
    // First check for a win
    if (_isWin(_firstPlayer, _secondPlayer)) {
      return Scenarios.winForFirstPlayer;
    }
    if (_isWin(_secondPlayer, _firstPlayer)) {
      return Scenarios.winForSecondPlayer;
    }

    // Then check for deuce
    if (_isDeuce()) {
      return Scenarios.deuce;
    }

    // Check for advantage
    if (_hasAdvantage(_firstPlayer, _secondPlayer)) {
      return Scenarios.advantageFirstPlayer;
    }
    if (_hasAdvantage(_secondPlayer, _firstPlayer)) {
      return Scenarios.advantageSecondPlayer;
    }

    // Return normal scores if no special conditions are met
    return "${_pointsToScore(_firstPlayer)} - ${_pointsToScore(_secondPlayer)}";
  }

  /// ============`Private Methods`============

  /// Check if the score is deuce
  bool _isDeuce() {
    if (_firstPlayer == _secondPlayer) {
      return _firstPlayer >= 3;
    } else {
      return false;
    }
  }

  /// Check if the player has advantage
  bool _hasAdvantage(int thisPlayer, int otherPlayer) =>
      thisPlayer > 3 && thisPlayer == otherPlayer + 1;

  /// Check if the player has won
  bool _isWin(int thisPlayer, int otherPlayer) =>
      thisPlayer >= 4 && thisPlayer >= otherPlayer + 2;

  /// Update the score based on the current score
  int _updateScore(int thisPlayer, int otherPlayer) {
    if (thisPlayer >= 3 && otherPlayer >= 3) {
      if (thisPlayer == otherPlayer) {
        // If both are equal and greater than 3, next point creates an advantage
        return thisPlayer + 1;
      } else if (thisPlayer == otherPlayer + 1) {
        // If player is already at advantage, next point should result in a win
        // You might want to handle this within the getScore() for a win condition instead of here
        return thisPlayer + 1;
      } else if (thisPlayer - 1 == otherPlayer) {
        // If player loses advantage, score returns to deuce
        return otherPlayer;
      }
    }
    // Normal score increment
    return thisPlayer + 1;
  }

  /// Convert points to score
  String _pointsToScore(int points) {
    switch (points) {
      case 0:
        return Scores.love;
      case 1:
        return Scores.fifteen;
      case 2:
        return Scores.thirty;
      case 3:
        return Scores.forty;
      default:
        return "Unknown score";
    }
  }
}
