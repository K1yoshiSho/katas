import 'package:tennis_score/base/tennis_game.dart';
import 'package:tennis_score/constant/player_names.dart';
import 'package:tennis_score/enums/player.dart';

/// `TennisGame` class is used to simulate a tennis game.
class SimpleTennisGameImp implements TennisGame {
  /// `_scoreNames` is a list of score names in a tennis game.
  static const List<String> _scoreNames = ['love', 'fifteen', 'thirty', 'forty'];

  // ============`Properties`============

  int _firstPlayerScore = 0;
  int _secondPlayerScore = 0;

  // ============`Methods`============

  /// `getScore` method returns the current score of the game.
  @override
  String getScore() {
    if (_isNormalScore()) {
      return _normalScore();
    } else {
      return _specialScore();
    }
  }

  /// `addPoint` method adds a point to the player.
  @override
  void addPoint({
    required PlayerEnum player,
  }) {
    if (player == PlayerEnum.first) {
      _firstPlayerScore++;
    } else {
      _secondPlayerScore++;
    }
  }

  // ============`Private Methods`============

  /// `_isNormalScore` method checks if the score is normal.
  ///
  /// `_firstPlayerScore < 4 && _secondPlayerScore < 4` checks if both players have scores less than four points,
  /// indicating that neither player has yet reached the 'forty' point mark. This is used to determine if the game
  /// is still in the early stages where normal scoring names ('love', 'fifteen', 'thirty', 'forty') are applicable.
  ///
  /// `(_firstPlayerScore + _secondPlayerScore != 6)` checks if the combined score of both players does not equal six.
  /// A combined score of six where each player has three points ('forty - forty') indicates a 'deuce' scenario in tennis,
  /// where special scoring rules begin to apply ('deuce', 'advantage', 'win'). This condition is used to exclude the
  /// 'deuce' state from normal scoring calculations.

  bool _isNormalScore() {
    return _firstPlayerScore < 4 && _secondPlayerScore < 4 && (_firstPlayerScore + _secondPlayerScore != 6);
  }

  /// `_normalScore` method returns the normal score of the game in a format understandable in tennis.
  String _normalScore() {
    /// Checks if both players have the same score.
    if (_firstPlayerScore == _secondPlayerScore) {
      /// If scores are equal, retrieves the corresponding tennis score name from `_scoreNames` using the index provided by `_firstPlayerScore`.
      final score = _scoreNames[_firstPlayerScore];

      /// Returns the score in a format "score - score", which in tennis indicates both players are at the same score (e.g., "thirty - thirty").
      return "$score - $score";
    } else {
      /// If scores are not equal, retrieves the respective tennis score names for both players from `_scoreNames` and returns them in the format "X - Y".
      /// This format is used when players have different scores (e.g., "fifteen - thirty").
      return "${_scoreNames[_firstPlayerScore]} - ${_scoreNames[_secondPlayerScore]}";
    }
  }

  /// `_specialScore` method returns the special score conditions in a tennis game, such as "deuce", "advantage", or "win".
  String _specialScore() {
    /// Checks if both players have the same score and if it is a high-scoring situation (implied by the context, typically 40-40).
    if (_firstPlayerScore == _secondPlayerScore) {
      /// Returns "deuce" when both players are tied at a high score, indicating neither player has an advantage yet.
      return "deuce";
    }

    /// Determines the leader based on who has the higher score.
    /// `Player.firstPlayerName` or `Player.secondPlayerName` is assigned to `leader` depending on who is ahead.
    String leader = _firstPlayerScore > _secondPlayerScore ? Player.firstPlayerName : Player.secondPlayerName;

    /// Calculates the absolute score difference between the two players to determine the margin of lead.
    int scoreDifference = (_firstPlayerScore - _secondPlayerScore).abs();

    /// Checks if the score difference is 1, which indicates one player has a slight edge but hasn't won yet.
    if (scoreDifference == 1) {
      /// Returns "advantage [leader]" indicating the leading player is close to winning, but the game isn't won yet.
      return "advantage $leader";
    } else {
      /// Returns "win for [leader]" when the score difference is more than 1, indicating the leader has won the game.
      return "win for $leader";
    }
  }
}
