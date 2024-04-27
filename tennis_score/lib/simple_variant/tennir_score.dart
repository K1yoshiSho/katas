import 'package:tennis_score/base/tennis_game.dart';
import 'package:tennis_score/constant/player_names.dart';
import 'package:tennis_score/enums/player.dart';

/// `TennisGame` class is used to simulate a tennis game.
class SimpleTennisGame implements TennisGame {
  /// `_scoreNames` is a list of score names in a tennis game.
  static const List<String> _scoreNames = ['love', 'fifteen', 'thirty', 'forty'];

  /// ============`Properties`============
  int _firstPlayerScore = 0;
  int _secondPlayerScore = 0;

  /// ============`Methods`============

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

  /// ============`Private Methods`============

  /// `_isNormalScore` method checks if the score is normal.
  bool _isNormalScore() {
    return _firstPlayerScore < 4 && _secondPlayerScore < 4 && (_firstPlayerScore + _secondPlayerScore != 6);
  }

  /// `_normalScore` method returns the normal score.
  String _normalScore() {
    if (_firstPlayerScore == _secondPlayerScore) {
      final score = _scoreNames[_firstPlayerScore];
      return "$score - $score";
    } else {
      return "${_scoreNames[_firstPlayerScore]} - ${_scoreNames[_secondPlayerScore]}";
    }
  }

  /// `_specialScore` method returns the special score.
  String _specialScore() {
    if (_firstPlayerScore == _secondPlayerScore) {
      return "deuce";
    }
    String leader = _firstPlayerScore > _secondPlayerScore ? Player.firstPlayerName : Player.secondPlayerName;
    int scoreDifference = (_firstPlayerScore - _secondPlayerScore).abs();
    if (scoreDifference == 1) {
      return "advantage $leader";
    } else {
      return "win for $leader";
    }
  }
}
