part of '../parrot_refactoring.dart';

/// Represents a Norwegian Blue type of parrot.
class NorwegianBlueParrot extends Parrot {
  NorwegianBlueParrot({required double voltage, required bool isNailed}) : super(voltage: voltage, isNailed: isNailed);

  /// Calculates speed based on voltage if the parrot is not nailed. Clamped between 0 and 24.
  double get baseSpeedVoltage => (voltage * baseSpeed).clamp(0, 24.0);

  @override

  /// Returns 0 if the parrot is nailed, otherwise calculates speed based on voltage.
  double get speed => isNailed ? 0.0 : baseSpeedVoltage;
}
