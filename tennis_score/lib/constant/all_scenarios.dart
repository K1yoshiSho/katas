import 'package:tennis_score/constant/player_names.dart';
import 'package:tennis_score/constant/score.dart';

/// `Scenarios` class is used to store all the possible scenarios in a tennis game.
final class Scenarios {
  /// ================`Same`================"

  static const String initial = "${Scores.love} - ${Scores.love}"; // 0 - 0
  static const String fifteenAll = "${Scores.fifteen} - ${Scores.fifteen}"; // 1 - 1
  static const String thirtyAll = "${Scores.thirty} - ${Scores.thirty}"; // 2 - 2
  static const String deuce = Scores.deuce; // 3 - 3

  /// ================`First Player`================"

  static const String fifteenLove = "${Scores.fifteen} - ${Scores.love}"; // 1 - 0
  static const String thirtyLove = "${Scores.thirty} - ${Scores.love}"; // 2 - 0
  static const String fortyLove = "${Scores.forty} - ${Scores.love}"; // 3 - 0
  static const String winForFirstPlayer = "${Scores.win} for ${Player.firstPlayerName}"; // win
  static const String thirtyFifteen = "${Scores.thirty} - ${Scores.fifteen}"; // 2 - 1
  static const String fortyFifteen = "${Scores.forty} - ${Scores.fifteen}"; // 3 - 1
  static const String fortyThirty = "${Scores.forty} - ${Scores.thirty}"; // 3 - 2
  static const String advantageFirstPlayer = "${Scores.advantage} ${Player.firstPlayerName}"; // 4 - 3 or 5 - 4

  /// ================`Second Player`================"

  static const String loveFifteen = "${Scores.love} - ${Scores.fifteen}"; // 0 - 1
  static const String loveThirty = "${Scores.love} - ${Scores.thirty}"; // 0 - 2
  static const String loveForty = "${Scores.love} - ${Scores.forty}"; // 0 - 3
  static const String winForSecondPlayer = "${Scores.win} for ${Player.secondPlayerName}"; // win
  static const String fifteenThirty = "${Scores.fifteen} - ${Scores.thirty}"; // 1 - 2
  static const String fifteenForty = "${Scores.fifteen} - ${Scores.forty}"; // 1 - 3
  static const String thirtyForty = "${Scores.thirty} - ${Scores.forty}"; // 2 - 3
  static const String advantageSecondPlayer = "${Scores.advantage} ${Player.secondPlayerName}"; // 3 - 4 or 4 - 5
}
