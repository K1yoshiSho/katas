part of '../../../expense_report.dart';

class Lunch extends Service with MealExpense {
  const Lunch({
    required super.amount,
  });

  @override
  int get expenseLimit => 2000;

  @override
  String get name => 'Lunch';
}
