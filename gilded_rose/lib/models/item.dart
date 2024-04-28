part of '../gilded_rose.dart';

final class Item {
  final String name;
  int sellIn;
  int quality;

  Item(
    this.name, {
    required this.sellIn,
    required this.quality,
  });

  @override
  String toString() => '$name, $sellIn, $quality';
}
