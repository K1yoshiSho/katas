import 'package:expense_report/src/models/base/meal_expende.dart';

class Breakfast implements MealExpense {
  @override
  final int amount;

  const Breakfast({
    required this.amount,
  });

  @override
  int get expenseLimit => 1000;

  @override
  String get name => 'Breakfast';
}
