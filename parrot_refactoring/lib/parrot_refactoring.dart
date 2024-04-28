part 'implementations/african_parrot.dart';
part 'implementations/norwegian_blue_parrot.dart';
part 'implementations/european_parrot.dart';

/// Abstract base class for a Parrot.
/// Defines common properties and an abstract `speed` getter that must be implemented by subclasses.
abstract class Parrot {
  const Parrot();

  /// Abstract getter to be implemented by subclasses to calculate the speed based on type-specific rules.
  double get speed;

  /// Base speed used as the starting point for speed calculations.
  double get baseSpeed => 12.0;
}
