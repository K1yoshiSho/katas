import 'package:expense_report/src/models/base/expense.dart';

class CarRental implements Service {
  @override
  final int amount;

  const CarRental({
    required this.amount,
  });

  @override
  String get name => 'Car Rental';
}
