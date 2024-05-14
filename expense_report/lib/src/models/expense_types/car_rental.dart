part of '../../../expense_report.dart';

class CarRental extends Service {
  const CarRental({
    required super.amount,
  });

  @override
  String get name => 'Car Rental';

  @override
  bool get isOverLimit => false;
}
