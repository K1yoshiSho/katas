import 'package:expense_report/src/models/base/meal_expende.dart';

class Lunch implements MealExpense {
  @override
  final int amount;

  const Lunch({
    required this.amount,
  });

  @override
  int get expenseLimit => 2000;

  @override
  String get name => 'Lunch';
}
