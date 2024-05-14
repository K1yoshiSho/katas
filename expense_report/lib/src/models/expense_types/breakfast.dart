part of '../../../expense_report.dart';

class Breakfast extends Service with MealExpense {
  const Breakfast({
    required super.amount,
  });

  @override
  int get expenseLimit => 1000;

  @override
  String get name => 'Breakfast';
}
