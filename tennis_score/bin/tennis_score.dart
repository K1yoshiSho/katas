import 'package:tennis_score/base/tennis_game.dart';
import 'package:tennis_score/tennis_score.dart';

void main(List<String> arguments) {
  final TennisGame game = TennisGameImp();
  print(game.getScore());
}
