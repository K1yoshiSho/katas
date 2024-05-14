part of '../../expense_report.dart';

enum ExpenseTypeEnum {
  dinner('Dinner'),
  breakfast('Breakfast'),
  carRental('Car Rental'),
  lunch('Lunch');

  final String name;

  const ExpenseTypeEnum(this.name);
}
