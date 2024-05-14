part of '../../../expense_report.dart';

abstract class Service {
  final int amount;

  const Service({required this.amount});

  String get name;
  bool get isOverLimit;
}
