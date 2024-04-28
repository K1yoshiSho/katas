part of '../parrot_refactoring.dart';

/// Represents a European type of parrot.
class EuropeanParrot extends Parrot {
  EuropeanParrot({required double voltage, required bool isNailed}) : super(voltage: voltage, isNailed: isNailed);

  @override

  /// Returns the base speed for a European parrot as they do not have factors reducing their speed.
  double get speed => baseSpeed;
}
