part of '../../../expense_report.dart';

class Dinner extends Service with MealExpense {
  const Dinner({
    required super.amount,
  });

  @override
  int get expenseLimit => 5000;

  @override
  String get name => 'Dinner';
}
