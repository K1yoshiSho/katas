part of '../../expense_report.dart';

mixin MealExpense on Service {
  int get expenseLimit;

  @override
  bool get isOverLimit => amount > expenseLimit;
}
