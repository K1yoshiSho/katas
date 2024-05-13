part of '../../expense_report.dart';

enum ExpenseType {
  dinner("Dinner"),
  breakfast("Breakfast"),
  carRental("Car Rental");

  final String name;

  const ExpenseType(this.name);
}
