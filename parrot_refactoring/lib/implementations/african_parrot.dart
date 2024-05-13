part of '../parrot_refactoring.dart';

/// Represents an African type of parrot.
class AfricanParrot extends Parrot {
  final int
      numberOfCoconuts; // Number of coconuts carried, which affects the parrot's speed.
  static const double loadFactor =
      9.0; // The factor by which speed is reduced per coconut.

  const AfricanParrot({required this.numberOfCoconuts});

  @override

  /// Calculates the speed of the African parrot based on the number of coconuts it carries.
  /// Speed cannot be less than 0.
  double get speed =>
      (baseSpeed - loadFactor * numberOfCoconuts).clamp(0, double.infinity);
}
