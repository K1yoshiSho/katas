import 'package:tennis_score/enums/player.dart';

/// `TennisGame` class is used to simulate a tennis game.
abstract interface class TennisGame {
  /// `addPoint` method adds a point to the player.
  void addPoint({required PlayerEnum player});

  /// `getScore` method returns the current score of the game.
  String getScore();
}
