import 'dart:math';

import 'package:tennis_score/base/tennis_game.dart';
import 'package:tennis_score/constant/all_scenarios.dart';
import 'package:tennis_score/enums/player.dart';
import 'package:tennis_score/simple_variant/tennir_score.dart';
import 'package:tennis_score/tennis_score.dart';
// import 'package:tennis_score/tennis_score.dart';
import 'package:test/test.dart';

part 'src/all_test_scenarios.dart';
part 'src/tennis_model.dart';
part 'src/tennis_score_test.dart';

void main() {
  group('Main: Check tennis score scenario:', () {
    for (final tested in allTestScenarios) {
      test('${tested.firstPlayerScore} - ${tested.secondPlayerScore} - ${tested.expectedScore}', () {
        final TennisGame game = TennisGameImp();
        _checkAllScenarios(game: game, testScenario: tested);
      });
    }
  });

  group('Simple: Check tennis score scenario:', () {
    for (final tested in allTestScenarios) {
      test('${tested.firstPlayerScore} - ${tested.secondPlayerScore} - ${tested.expectedScore}', () {
        final TennisGame game = SimpleTennisGame();
        _checkAllScenarios(game: game, testScenario: tested);
      });
    }
  });
}
